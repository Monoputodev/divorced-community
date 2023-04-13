@php
    $user = auth()->user();
    $lang = App\Models\LangInfo::all();
@endphp
@extends($activeTemplate . 'layouts.frontend')
@section('content')
    <div class="login section basic-info">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="login__wrapper basic-information">
                        <form class="info-form" action="{{ route('user.data.submit', 'basicInfo') }}" autocomplete="off" method="POST">
                            @csrf
                            <div class="section__head text-center">
                                <h2 class="login-title mt-0">@lang('Basic Information')</h2>
                                <p>@lang('Fill up your basic information with authenticated data, you also can skip this step by clicking skip button')</p>
                            </div>
                            <div class="row gy-4">
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <input class="datepicker-here form-control form--control" name="birth_date" data-date-format="yyyy-mm-dd" data-language="en" data-position='bottom right' data-range="false" type="text" value="{{ old('birth_date') }}" autocomplete="off" required>
                                        <label class="form--label">@lang('Date Of Birth')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <select class="form-select form-control form--control" name="religion" required>
                                            <option value="">@lang('Select One')</option>
                                            @foreach ($religions as $religion)
                                                <option value="{{ $religion->name }}" @if (old('religion') == $religion->name) selected @endif>
                                                    {{ __($religion->name) }}
                                                </option>
                                            @endforeach
                                        </select>
                                        <label class="form--label">@lang('Religion')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <select class="form-select form-control form--control" name="gender" required>
                                            <option value="">@lang('Select One')</option>
                                            <option value="m" @if (old('gender') == 'm') selected @endif>
                                                @lang('Male')</option>
                                            <option value="f" @if (old('gender') == 'f') selected @endif>
                                                @lang('Female')</option>
                                        </select>
                                        <label class="form--label">@lang('Gender')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <select class="form-select form-control form--control" name="marital_status" required>
                                            <option value="">@lang('Select One')</option>
                                            @foreach ($maritalStatuses as $maritalStatus)
                                                <option value="{{ $maritalStatus->title }}" @if (old('marital_status') == $maritalStatus->title) selected @endif>
                                                    {{ __($maritalStatus->title) }}
                                                </option>
                                            @endforeach
                                        </select>
                                        <label class="form--label">@lang('Marital Status')</label>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <select class="form-control form--control select2-auto-tokenize" name="languages[]" multiple="multiple" placeholder="none" required>
                                            @foreach ($lang as $Language)
                                                <option value="{{ $Language->name }}">{{ $Language->name }}</option>
                                            @endforeach
                                        </select>
                                        <label class="form--label">@lang('Languages')</label>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <input class="form-control form--control" name="profession" type="text" value="{{ old('profession') }}" required>
                                        <label class="form--label">@lang('Profession')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <input class="form-control form--control" name="financial_condition" type="text" value="{{ old('financial_condition') }}" required>
                                        <label class="form--label">@lang('Financial Condition')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <select class="form-select form-control form--control" name="smoking_status" required>
                                            <option value="">@lang('Select One')</option>
                                            <option value="1" @selected(old('smoking_status') == 1)>@lang('Smoker')</option>
                                            <option value="0" @selected(old('smoking_status') == 0)>@lang('Non-smoker')</option>
                                        </select>
                                        <label class="form--label">@lang('Smoking Habits')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <select class="form-select form-control form--control" name="drinking_status" required>
                                            <option value="">@lang('Select One')</option>
                                            <option value="1" @selected(old('drinking_status') == 1)>@lang('Drunker')</option>
                                            <option value="0" @selected(old('drinking_status') == 0)>@lang('Non-drunker')</option>
                                        </select>
                                        <label class="form--label">@lang('Drinking Status')</label>
                                    </div>
                                </div>

                                <small>@lang('Present Address')</small>

                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <select class="form-select form-control form--control" name="pre_country" @disabled(@$user->address->country)>
                                            <option value="">@lang('Select One')</option>
                                            @foreach ($countries as $country)
                                                <option value="{{ $country->country }}" @if (old('pre_country', @$user->address->country) == $country->country) selected @endif>
                                                    {{ __($country->country) }}
                                                </option>
                                            @endforeach
                                        </select>
                                        <label class="form--label">@lang('Permanent Country')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <input class="form-control form--control" name="pre_state" type="text" value="{{ old('pre_state', @$user->address->state) }}">
                                        <label class="form--label">@lang('State')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <input class="form-control form--control" name="pre_zip" type="text" value="{{ old('pre_zip', @$user->address->zip) }}">
                                        <label class="form--label">@lang('Zip Code')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <input class="form-control form--control" name="pre_city" type="text" value="{{ old('pre_city', @$user->address->city) }}" required>
                                        <label class="form--label">@lang('City')</label>
                                    </div>
                                </div>

                                <small>
                                    <div class="form--check">
                                        @lang('Permanent Address') :
                                        <input class="form-check-input" id="copyAddress" type="checkbox">
                                        <label class="form-check-label" for="copyAddress">
                                            @lang('Same as present address?')
                                        </label>
                                    </div>
                                </small>

                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <select class="form-select form-control form--control" name="per_country" required>
                                            <option value="">@lang('Select One')</option>
                                            @foreach ($countries as $country)
                                                <option value="{{ $country->country }}" @if (old('per_country') == $country->country) selected @endif>
                                                    {{ __($country->country) }}
                                                </option>
                                            @endforeach
                                        </select>
                                        <label class="form--label">@lang('Present Country')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <input class="form-control form--control permanent" name="per_state" type="text" value="{{ old('per_state') }}" required>
                                        <label class="form--label">@lang('State')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <input class="form-control form--control permanent" name="per_zip" type="text" value="{{ old('per_zip') }}">
                                        <label class="form--label">@lang('Zip Code')</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input--group">
                                        <input class="form-control form--control permanent" name="per_city" type="text" value="{{ old('per_city') }}" required>
                                        <label class="form--label">@lang('City')</label>
                                    </div>
                                </div>
                                <div class="append-form d-none"></div>
                                <div class="d-flex justify-content-end flex-wrap gap-2">
                                    <button class="btn btn-sm btn--dark skip-all" type="button"><i class="las la-hand-point-right"></i> @lang('Skip All')</button>
                                    <button class="btn btn-sm btn--warning skip-btn" type="button"><i class="las la-forward"></i> @lang('Skip')</button>
                                    <button class="btn btn-sm btn-success" name="button_value" type="submit" value="submit">@lang('Next') <i class="las la-arrow-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('style-lib')
    <link href="{{ asset('assets/admin/css/vendor/select2.min.css') }}" rel="stylesheet">
@endpush

@push('script-lib')
    <script src="{{ asset('assets/admin/js/vendor/select2.min.js') }}"></script>
    <script src="{{ asset('assets/admin/js/vendor/datepicker.min.js') }}"></script>
    <script src="{{ asset('assets/admin/js/vendor/datepicker.en.js') }}"></script>
@endpush

@push('script')
    <script>
        "use strict";
        $('.skip-btn').on('click', function() {
            $('.info-form').submit();
        });

        $('.select2-auto-tokenize').select2({
            dropdownParent: $('.basic-info'),
            tags: true,
            tokenSeparators: [',']
        });

        $('#copyAddress').on('change', function() {
            let perCountry = $('[name=per_country]');
            let perState = $('[name=per_state]');
            let perZip = $('[name=per_zip]');
            let perCity = $('[name=per_city]');
            if ($(this).is(':checked')) {
                perCountry.val($('[name=pre_country]').val());
                perState.val($('[name=pre_state]').val());
                perZip.val($('[name=pre_zip]').val());
                perCity.val($('[name=pre_city]').val());
            } else {
                perCountry.val('');
                perState.val('');
                perZip.val('');
                perCity.val('');
            }
        })

        $('.skip-all').on('click', function() {
            $('.append-form').append(`<input type="hidden" name="skip_all" value="1" >`);
            $('.info-form').submit();
        })
    </script>
@endpush
