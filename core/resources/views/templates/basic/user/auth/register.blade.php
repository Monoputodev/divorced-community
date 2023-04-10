@extends($activeTemplate . 'layouts.frontend')
@php
    $info = json_decode(json_encode(getIpInfo()), true);
    $mobileCode = @implode(',', $info['code']);
    $countries = json_decode(file_get_contents(resource_path('views/partials/country.json')));
    $registerContent = getContent('register.content', true);
    $policyPages = getContent('policy_pages.element', false, null, true);
@endphp
@section('content')
    <div class="login section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="login__wrapper">
                        <form class="login__form verify-gcaptcha" action="{{ route('user.register') }}" autocomplete="off" method="POST">
                            @csrf
                            <div class="section__head text-center">
                                <h2 class="login-title mt-0">{{ __($registerContent->data_values->heading) }}</h2>
                                <p class="t-short-para mx-auto mb-0 text-center">
                                    {{ __($registerContent->data_values->subheading) }}
                                </p>
                            </div>
                            <div class="row g-3">
                                <div class="col-sm-12">
                                    <div class="input--group">
                                        <select class="form-select form--control form-control" id="looking_for" name="looking_for" required>
                                            <option value="">@lang('Select One')</option>
                                            <option value="1" @selected(old('looking_for') == 1)>@lang('Bridegroom')</option>
                                            <option value="2" @selected(old('looking_for') == 2)>@lang('Bride')</option>
                                        </select>
                                        <label class="form--label" for="looking_for">@lang('Looking For')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <input class="form-control form--control checkUser" id="username" name="username" type="text" value="{{ old('username') }}" autocomplete="off" placeholder="none" required>
                                        <label class="form--label" for="username">@lang('Username')</label>
                                        <small class="text-danger usernameExist"></small>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <input class="form-control form--control" id="firstname" name="firstname" type="text" value="{{ old('firstname') }}" autocomplete="off" placeholder="none" required>
                                        <label class="form--label" for="firstname">@lang('First Name')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <input class="form-control form--control" id="lastname" name="lastname" type="text" value="{{ old('lastname') }}" autocomplete="off" placeholder="none" required>
                                        <label class="form--label" for="lastname">@lang('Last Name')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <input class="form-control form--control checkUser" id="email" name="email" type="email" value="{{ old('email') }}" placeholder="none" required>
                                        <label class="form--label" for="email">@lang('E-Mail Address')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6 mt-4">
                                    <div class="input--group">
                                        <select class="form-select form-control form--control" id="country" name="country">
                                            @foreach ($countries as $key => $country)
                                                <option data-code="{{ $key }}" data-mobile_code="{{ $country->dial_code }}" value="{{ $country->country }}" @selected(old('country') == $key)>
                                                    {{ __($country->country) }}</option>
                                            @endforeach
                                        </select>
                                        <label class="form--label" for="country">@lang('Country')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6 mt-4">
                                    <div class="input--group">
                                        <div class="input-group">
                                            <span class="input-group-text mobile-code"></span>
                                            <input name="mobile_code" type="hidden">
                                            <input name="country_code" type="hidden">
                                            <input class="form-control form--control checkUser" id="mobile" name="mobile" type="number" value="{{ old('mobile') }}" placeholder="none" required>
                                        </div>
                                        <small class="text-danger mobileExist"></small>
                                    </div>
                                </div>
                                <div class="col-sm-6 mt-4">
                                    <div class="input--group">
                                        <input class="form-control form--control" id="password" name="password" type="password" placeholder="none" required>
                                        <label class="form--label" for="password">@lang('Password')</label>
                                        @if ($general->secure_password)
                                            <div class="input-popup">
                                                <p class="error lower">@lang('1 small letter minimum')</p>
                                                <p class="error capital">@lang('1 capital letter minimum')</p>
                                                <p class="error number">@lang('1 number minimum')</p>
                                                <p class="error special">@lang('1 special character minimum')</p>
                                                <p class="error minimum">@lang('6 character password')</p>
                                            </div>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-sm-6 mt-4">
                                    <div class="input--group">
                                        <input class="form-control form--control" id="password_confirmation" name="password_confirmation" type="password" placeholder="none" required>
                                        <label class="form--label" for="password_confirmation">@lang('Confirm Password')</label>
                                    </div>
                                </div>

                                <x-captcha />

                                @if ($general->agree)
                                    <div class="col-sm-12 mt-4">
                                        <div class="input--group d-flex align-items-center justify-content-start flex-wrap text-start">
                                            <div class="form--check me-2">
                                                <input class="form-check-input" id="agree" name="agree" type="checkbox" @checked(old('agree')) required>
                                                <label class="form-check-label" for="agree">
                                                    @lang('I agree with ')
                                                </label>
                                                @foreach ($policyPages as $policy)
                                                    <a href="{{ route('policy.pages', [slug($policy->data_values->title), $policy->id]) }}" target="_blank">
                                                        {{ __($policy->data_values->title) }}
                                                    </a>
                                                    @if (!$loop->last)
                                                        ,
                                                    @endif
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                @endif

                                <div class="col-12">
                                    <button class="btn btn--md btn--base w-100" data-bs-toggle="list" type="submit"> @lang('Register') </button>
                                </div>

                                <div class="col-sm-12">
                                    <div class="login-account text-center">
                                        <p class="mb-0 mt-3">@lang('Have an account? ') <a href="{{ route('user.login') }}">@lang('Login')</a></p>
                                    </div>
                                </div>

                            </div>
                        </form>
                        @include($activeTemplate . 'partials.social_login')
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="existModalCenter" role="dialog" aria-hidden="true" aria-labelledby="existModalCenterTitle" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="existModalLongTitle">@lang('You are with us')</h5>
                    <span class="close" data-bs-dismiss="modal" type="button" aria-label="Close">
                        <i class="las la-times"></i>
                    </span>
                </div>
                <div class="modal-body">
                    <h6>@lang('You already have an account, please login!')</h6>
                </div>
                <div class="modal-footer">
                    <button class="btn btn--dark btn-sm" data-bs-dismiss="modal" type="button">@lang('Close')</button>
                    <a class="btn btn--base btn-sm" href="{{ route('user.login') }}">@lang('Login')</a>
                </div>
            </div>
        </div>
    </div>
@endsection

@if ($general->secure_password)
    @push('script-lib')
        <script src="{{ asset('assets/global/js/secure_password.js') }}"></script>
    @endpush
@endif
@push('script')
    <script>
        "use strict";
        (function($) {
            @if ($mobileCode)
                $(`option[data-code={{ $mobileCode }}]`).attr('selected', '');
            @endif

            $('select[name=country]').change(function() {
                $('input[name=mobile_code]').val($('select[name=country] :selected').data('mobile_code'));
                $('input[name=country_code]').val($('select[name=country] :selected').data('code'));
                $('.mobile-code').text('+' + $('select[name=country] :selected').data('mobile_code'));
            });
            $('input[name=mobile_code]').val($('select[name=country] :selected').data('mobile_code'));
            $('input[name=country_code]').val($('select[name=country] :selected').data('code'));
            $('.mobile-code').text('+' + $('select[name=country] :selected').data('mobile_code'));

            $('.checkUser').on('focusout', function(e) {
                var url = '{{ route('user.checkUser') }}';
                var value = $(this).val();
                var token = '{{ csrf_token() }}';
                if ($(this).attr('name') == 'mobile') {
                    var mobile = `${$('.mobile-code').text().substr(1)}${value}`;
                    var data = {
                        mobile: mobile,
                        _token: token
                    }
                }
                if ($(this).attr('name') == 'email') {
                    var data = {
                        email: value,
                        _token: token
                    }
                }
                if ($(this).attr('name') == 'username') {
                    var data = {
                        username: value,
                        _token: token
                    }
                }
                $.post(url, data, function(response) {
                    if (response.data != false && response.type == 'email') {
                        $('#existModalCenter').modal('show');
                    } else if (response.data != false) {
                        $(`.${response.type}Exist`).text(`${response.type} already exist`);
                    } else {
                        $(`.${response.type}Exist`).text('');
                    }
                });
            });
        })(jQuery);
    </script>
@endpush

@push('style')
    <style>
        .country-code .input-group-text {
            background: #fff !important;
        }

        .country-code select {
            border: none;
        }

        .country-code select:focus {
            border: none;
            outline: none;
        }

        .modal .btn {
            padding: 5px 10px !important;
        }

        .modal-title {
            margin: 0;
            line-height: 0 !important;
        }

        .modal-body h6 {
            margin: 1rem 1rem;
        }
    </style>
@endpush
