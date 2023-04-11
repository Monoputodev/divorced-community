@php
    $memberContent = getContent('member.content', true);
    $memberElement = App\Models\User::all();
    $user    = auth()->user();
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



    <div class="container">
        <div class="row">

            @foreach ($memberElement as $member)
                <div class="col-sm-12 col-md-4 col-lg-3 mb-4">
                    <div class="card text-white card-has-bg click-col"  style="background-image:url('{{ getImage(getFilePath('userProfile') . '/' . $member->image, null, 'user') }}');background-size:cover;background-repeat:no-repeat;">
                        <div class="card-img-overlay d-flex flex-column">
                            <div class="card-body">
                                <h4 class="card-title mt-0 "><a class="text-white" herf="#">
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
                                            @elseif(@$user &&
                                                $member->interests->where('interesting_id', @$user->id)->where('status', 0)->first())
                                                <a class="base-color" href="#">
                                                    <i class="fas fa-heart"></i>@lang('Response to Interest')
                                                </a>
                                            @elseif(@$user &&
                                                $member->interests->where('interesting_id', @$user->id)->where('status', 1)->first())
                                                <a class="base-color" href="#">
                                                    <i class="fas fa-heart"></i>@lang('You Accepted Interest')
                                                </a>
                                            @else
                                                <a class="interestExpressBtn" data-interesting_id="{{ $member->id }}" href="javascript:void(0)">
                                                    <i class="fas fa-heart"></i>@lang('Interest')
                                                </a>
                                            @endif
                                        </li>
                                        <li>
                                            <a class="confirmationBtn ignore" data-action="{{ route('user.ignore', $member->id) }}" data-question="@lang('Are you sure, you want to ignore this member?')" href="javascript:void(0)">
                                                <i class="fas fa-user-times text--danger"></i>@lang('Ignore')
                                            </a>
                                        </li>
                                        <li>
                                            @if (@$user && $user->shortListedProfile->where('profile_id', $member->id)->first())
                                                <a class="removeFromShortList" data-action="{{ route('user.remove.short.list') }}" data-profile_id="{{ $member->id }}" href="javascript:void(0)">
                                                    <i class="far fa-star"></i>@lang('Shortlisted')
                                                </a>
                                            @else
                                                <a class="addToShortList" data-action="{{ route('user.add.short.list') }}" data-profile_id="{{ $member->id }}" href="javascript:void(0)">
                                                    <i class="far fa-star"></i>@lang('Shortlist')
                                                </a>
                                            @endif
                                        </li>
                                        <li>
                                            @php
                                                $report = $user ? $user->reports->where('complaint_id', $member->id)->first() : null;
                                            @endphp
                                            @if (@$user && $report)
                                                <a class="text--danger reportedUser" data-report_reason="{{ __($report->reason) }}" data-report_title="{{ __($report->title) }}" href="javascript:void(0)">
                                                    <i class="fas fa-info-circle"></i>@lang('Reported')
                                                </a>
                                            @else
                                                <a href="javascript:void(0)" onclick="showReportModal({{ $member->id }})">
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
            @endforeach

            <x-report-modal />
            <x-interest-express-modal />
            <x-confirmation-modal />
        </div>

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
                    $(li).find('a').html(`<i class="fas fa-heart"></i>${config.loadingText.interestExpress}..`);
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






    {{-- <div class="col-md-12">
        <div class="search__right">
            <div class="row">
                <div class="col-md-4">
                    <div class="search__right-thumb">
                        <a href="{{ route('user.member.profile.public', $member->id) }}"><img src="{{ getImage(getFilePath('userProfile') . '/' . $member->image, null, 'user') }}" alt="@lang('Member')"></a>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="search__right-content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="member-info d-flex justify-content-between align-items-center mb-2">
                                    <div>
                                        <h5 class="member-info__name mt-0 mb-1"><a href="{{ route('user.member.profile.public', $member->id) }}"> {{ $member->fullname }}</a>
                                        </h5>
                                        <p class="member-info__id mb-0"> @lang('Member ID'):
                                            <span>
                                                {{ $member->profile_id }}
                                            </span>
                                        </p>
                                    </div>
                                    @if (@$member->limitation->package->price > 0)
                                        <span class="badge badge--green">{{ __('Premium') }}
                                        </span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="search__right-details">
                                    <div class="row member-details">
                                        <label class="col-5"><span>@lang('Looking For')</span></label>
                                        <span class="col-7">
                                            @if ($member->looking_for == 1)
                                                @lang('Male')
                                            @elseif($member->looking_for == 2)
                                                @lang('Female')
                                            @endif
                                        </span>
                                    </div>
                                    <div class="row member-details">
                                        <label class="col-5"><span>@lang('Age')</span></label>
                                        <span class="col-7">
                                            @php
                                                if (@$member->basicInfo->birth_date) {
                                                    $age = now()->diffInYears($member->birth_date) . ' Years';
                                                } else {
                                                    $age = __('N/A');
                                                }
                                            @endphp
                                            {{ __($age) }}
                                        </span>
                                    </div>
                                    <div class="row member-details">
                                        <label class="col-5"><span>@lang('Marital Status')</span></label>
                                        <span class="col-7">
                                            {{ __($member->basicInfo->marital_status ?? __('N/A')) }}
                                        </span>
                                    </div>
                                    <div class="row member-details">
                                        <label class="col-5"><span>@lang('Language')</span></label>
                                        <span class="col-7">
                                            @if ($member->basicInfo && count($member->basicInfo->language))
                                                {{ implode(', ', $member->basicInfo->language) }}
                                            @else
                                                @lang('N/A')
                                            @endif
                                        </span>
                                    </div>
                                    <div class="row member-details">
                                        <label class="col-5"><span>@lang('Present Address')</span></label>
                                        <span class="col-7">
                                            @if (@$member->basicInfo->present_address)
                                                {{ __(@$member->basicInfo->present_address->city) }}
                                                @if (@$member->basicInfo->present_address->city)
                                                    ,
                                                @endif
                                                {{ __(@$member->basicInfo->present_address->country) }}
                                            @else
                                                @lang('N/A')
                                            @endif
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="search__right-details">
                                    @if (@$member->basicInfo->gender)
                                        <div class="row member-details">
                                            <label class="col-5"><span>@lang('Gender')</span></label>
                                            <span class="col-7">
                                                @if (@$member->basicInfo->gender == 'm')
                                                    @lang('Male')
                                                @elseif(@$member->basicInfo->gender == 'f')
                                                    @lang('Female')
                                                @endif
                                            </span>
                                        </div>
                                    @endif
                                    <div class="row member-details">
                                        <label class="col-5"><span>@lang('Blood Group')</span></label>
                                        <span class="col-7">
                                            {{ __(@$member->physicalAttributes->blood_group ?? __('N/A')) }}
                                        </span>
                                    </div>
                                    <div class="row member-details">
                                        <label class="col-5"><span>@lang('Religion')</span></label>
                                        <span class="col-7">
                                            {{ __(@$member->basicInfo->religion ?? __('N/A')) }}
                                        </span>
                                    </div>
                                    <div class="row member-details">
                                        <label class="col-5"><span>@lang('Height')</span></label>
                                        <span class="col-7">
                                            {{ @$member->physicalAttributes->height ? __(@$member->physicalAttributes->height) . ' Ft.' : __('N/A') }}
                                        </span>
                                    </div>
                                    <div class="row member-details">
                                        <label class="col-5">
                                            <span data-bs-toggle="tooltip" title="@lang('Permanent Address')">@lang('Per. Address')</span>
                                        </label>
                                        <span class="col-7">
                                            @if (@$member->basicInfo->permanent_address)
                                                {{ __(@$member->basicInfo->permanssent_address->city) }}
                                                @if (@$member->basicInfo->permanent_address->city)
                                                    ,
                                                @endif
                                                {{ __(@$member->basicInfo->permanent_address->country) }}
                                            @else
                                                @lang('N/A')
                                            @endif
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="search__right-expression">
                                    <ul class="search__right-list m-0 p-0">
                                        <li>
                                            @if (@$user && $user->interests->where('interesting_id', $member->id)->first())
                                                <a class="base-color" href="javascript:void(0)">
                                                    <i class="fas fa-heart"></i>@lang('Interested')
                                                </a>
                                            @elseif(@$user &&
                                                $member->interests->where('interesting_id', @$user->id)->where('status', 0)->first())
                                                <a class="base-color" href="#">
                                                    <i class="fas fa-heart"></i>@lang('Response to Interest')
                                                </a>
                                            @elseif(@$user &&
                                                $member->interests->where('interesting_id', @$user->id)->where('status', 1)->first())
                                                <a class="base-color" href="#">
                                                    <i class="fas fa-heart"></i>@lang('You Accepted Interest')
                                                </a>
                                            @else
                                                <a class="interestExpressBtn" data-interesting_id="{{ $member->id }}" href="javascript:void(0)">
                                                    <i class="fas fa-heart"></i>@lang('Interest')
                                                </a>
                                            @endif
                                        </li>
                                        <li>
                                            <a class="confirmationBtn ignore" data-action="{{ route('user.ignore', $member->id) }}" data-question="@lang('Are you sure, you want to ignore this member?')" href="javascript:void(0)">
                                                <i class="fas fa-user-times text--danger"></i>@lang('Ignore')
                                            </a>
                                        </li>
                                        <li>
                                            @if (@$user && $user->shortListedProfile->where('profile_id', $member->id)->first())
                                                <a class="removeFromShortList" data-action="{{ route('user.remove.short.list') }}" data-profile_id="{{ $member->id }}" href="javascript:void(0)">
                                                    <i class="far fa-star"></i>@lang('Shortlisted')
                                                </a>
                                            @else
                                                <a class="addToShortList" data-action="{{ route('user.add.short.list') }}" data-profile_id="{{ $member->id }}" href="javascript:void(0)">
                                                    <i class="far fa-star"></i>@lang('Shortlist')
                                                </a>
                                            @endif
                                        </li>
                                        <li>
                                            @php
                                                $report = $user ? $user->reports->where('complaint_id', $member->id)->first() : null;
                                            @endphp
                                            @if (@$user && $report)
                                                <a class="text--danger reportedUser" data-report_reason="{{ __($report->reason) }}" data-report_title="{{ __($report->title) }}" href="javascript:void(0)">
                                                    <i class="fas fa-info-circle"></i>@lang('Reported')
                                                </a>
                                            @else
                                                <a href="javascript:void(0)" onclick="showReportModal({{ $member->id }})">
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
            </div>
        </div>
    </div> --}}



    {{-- @foreach ($memberElement as $item)
<li>{{ $item->profile_id }}</li>
@endforeach --}}

    {{-- <div class="container">
        <div class="row member-slider">
            @foreach ($memberElement as $member)
                <div class="member-slider__item">
                    <div class="feedback-card">
                        <div class="feedback-card__thumb">
                            <div class="user">
                                <img class="user__img" src="{{ getImage('assets/images/frontend/member/' . @$member->data_values->profile_picture, '120x120') }}" alt="@lang('Profile Picture')">
                            </div>
                        </div>
                        <!-- -->
                        <p class="feedback-card__para">
                            {{ __($member->data_values->speech) }}
                        </p>
                        <div class="feedback-card__footer">
                            <div class="d-flex align-items-center justify-content-between gap-3">
                                <div class="user__content">
                                    <h6 class="m-0"> {{ __($member->data_values->name) }}</h6>
                                    <p class="mb-0"> {{ __($member->data_values->designation) }} </p>
                                </div>
                                <ul class="user__rating list d-flex align-items-center flex-row gap-1">
                                    @php echo displayRating($member->data_values->star); @endphp
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div> --}}
</div>
<!-- Member Section End -->
