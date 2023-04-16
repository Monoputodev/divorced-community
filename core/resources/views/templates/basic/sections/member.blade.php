@php
    $memberContent = getContent('member.content', true);
    $memberElement = App\Models\User::where('status',1)->get();
    $user = auth()->user();
@endphp

<!-- Member Section  -->
<div class="section section--bg">
    <div class="section__head">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 col-xl-6">
                    <h2 class="mt-0 text-center">{{ __(@$memberContent->data_values->heading) }}</h2>
                    <p class="section__para mx-auto mb-0 text-center">
                        {{ __(@$memberContent->data_values->subheading) }}
                    </p>
                </div>
            </div>
        </div>
    </div>

<style>
     div.profile-card {
        position: relative;
    }

    div.profile-card a.profile-link {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        text-decoration: none; /* No underlines on the link */
        z-index: 10; /* Places the link above everything else in the div */
        background-color: #FFF; /* Fix to make div clickable in IE */
        opacity: 0; /* Fix to make div clickable in IE */
        filter: alpha(opacity=1); /* Fix to make div clickable in IE */
    }
</style>


    <div class="container">
        <div class="row member-slider">
            @foreach ($memberElement as $member)

            @if($member->limitation->package_id > 1)
                <div class="m-3">

                    <div class="card text-white card-has-bg click-col profile-card"
                        style="background-image:url('{{ getImage(getFilePath('userProfile') . '/' . $member->image, null, 'user') }}');background-size:cover;background-repeat:no-repeat;" >
                        <a class="profile-link" href="{{ route('user.member.profile.public', $member->id) }}"></a>
                        <div class="card-img-overlay d-flex flex-column">
                            <div class="card-body">
                                <h4 class="card-title mt-0 "><a class="text-white" herf="{{ route('user.member.profile.public', $member->id) }}">
                                        {{ $member->profile_id }}</a></h4>

                            </div>
                            <div class="card-footer">
                                <div class="search__right-expression">
                                    <ul class="search__right-list m-0 p-0">
                                        <li>
                                            @if (@$user && $user->interests->where('interesting_id', $member->id)->first())
                                                <a class="base-color" href="javascript:void(0)">
                                                    <i class="fas fa-heart"></i>@lang('Interested')
                                                </a>
                                            @elseif(
                                                @$user &&
                                                    $member->interests->where('interesting_id', @$user->id)->where('status', 0)->first())
                                                <a class="base-color" href="#">
                                                    <i class="fas fa-heart"></i>@lang('Response to Interest')
                                                </a>
                                            @elseif(
                                                @$user &&
                                                    $member->interests->where('interesting_id', @$user->id)->where('status', 1)->first())
                                                <a class="base-color" href="#">
                                                    <i class="fas fa-heart"></i>@lang('You Accepted Interest')
                                                </a>
                                            @else
                                                <a class="interestExpressBtn" data-interesting_id="{{ $member->id }}"
                                                    href="javascript:void(0)">
                                                    <i class="fas fa-heart"></i>@lang('Interest')
                                                </a>
                                            @endif
                                        </li>
                                        <li>
                                            <a class="confirmationBtn ignore"
                                                data-action="{{ route('user.ignore', $member->id) }}"
                                                data-question="@lang('Are you sure, you want to ignore this member?')" href="javascript:void(0)">
                                                <i class="fas fa-user-times text--danger"></i>@lang('Ignore')
                                            </a>
                                        </li>
                                        <li>
                                            @if (@$user && $user->shortListedProfile->where('profile_id', $member->id)->first())
                                                <a class="removeFromShortList"
                                                    data-action="{{ route('user.remove.short.list') }}"
                                                    data-profile_id="{{ $member->id }}" href="javascript:void(0)">
                                                    <i class="far fa-star"></i>@lang('Shortlisted')
                                                </a>
                                            @else
                                                <a class="addToShortList"
                                                    data-action="{{ route('user.add.short.list') }}"
                                                    data-profile_id="{{ $member->id }}" href="javascript:void(0)">
                                                    <i class="far fa-star"></i>@lang('Shortlist')
                                                </a>
                                            @endif
                                        </li>
                                        <li>
                                            @php
                                                $report = $user ? $user->reports->where('complaint_id', $member->id)->first() : null;
                                            @endphp
                                            @if (@$user && $report)
                                                <a class="text--danger reportedUser"
                                                    data-report_reason="{{ __($report->reason) }}"
                                                    data-report_title="{{ __($report->title) }}"
                                                    href="javascript:void(0)">
                                                    <i class="fas fa-info-circle"></i>@lang('Reported')
                                                </a>
                                            @else
                                                <a href="javascript:void(0)"
                                                    onclick="showReportModal({{ $member->id }})">
                                                    <i class="fas fa-info-circle"></i>@lang('Report')
                                                </a>
                                            @endif

                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                @endif
            @endforeach


        </div>
        <x-report-modal />
        <x-interest-express-modal />
        <x-confirmation-modal />
    </div>







    @push('script')
        <script>
            "use strict";

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            let config = {
                routes: {
                    addShortList: "{{ route('user.add.short.list') }}",
                    removeShortList: "{{ route('user.remove.short.list') }}",
                },
                loadingText: {
                    addShortList: "{{ trans('Shortlisting') }}",
                    removeShortList: "{{ trans('Removing') }}",
                    interestExpress: "{{ trans('Processing') }}",
                },
                buttonText: {
                    addShortList: "{{ trans('Shortlist') }}",
                    removeShortList: "{{ trans('Shortlisted') }}",
                    interestExpressed: "{{ trans('Interested') }}",
                    expressInterest: "{{ trans('Interest') }}",
                }
            }

            $('.express-interest-form').on('submit', function(e) {
                e.preventDefault();
                let formData = new FormData(this);
                let url = $(this).attr('action');
                let modal = $('#interestExpressModal');
                let id = modal.find('[name=interesting_id]').val();
                let li = $(`.interestExpressBtn[data-interesting_id="${id}"]`).parents('li');
                $.ajax({
                    type: "post",
                    url: url,
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function() {
                        $(li).find('a').html(
                            `<i class="fas fa-heart"></i>${config.loadingText.interestExpress}..`);
                    },
                    success: function(response) {
                        modal.modal('hide');
                        if (response.success) {
                            notify('success', response.success);
                            li.find('a').remove();
                            li.html(`<a href="javascript:void(0)" class="base-color">
                            <i class="fas fa-heart"></i>${config.buttonText.interestExpressed}
                        </a>`);
                        } else {
                            notify('error', response.error);
                            li.html(`<a href="javascript:void(0)" class="interestExpressBtn" data-interesting_id="${id}">
                                <i class="fas fa-heart"></i>${config.buttonText.expressInterest}
                        </a>`);
                        }
                    }
                });
            })
        </script>
        <script src="{{ asset($activeTemplateTrue . 'js/member.js') }}"></script>
    @endpush

</div>
<!-- Member Section End -->

