@php
    $content = getContent('blogs.content', true);
    $element = getContent('blogs.element', false, 16);
@endphp

<!-- Blog Section  Start-->
<div class="section blog-blogs">
    <div class="section__head">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 col-xl-6">
                    <h2 class="mt-0 text-center text-dark"> {{ __(@$content->data_values->heading) }}</h2>
                    <p class="section__para mx-auto mb-0 text-center">
                        {{ __(@$content->data_values->subheading) }}
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        @include($activeTemplate . 'partials.blogs_grid', ['blogs' => $element])
    </div>
</div>
<!-- Blog Section End -->
