{{-- <div class="row g-0 filter-container">
    @foreach ($blogs as $blog)
        <div class="col-xl-3 col-lg-4 col-md-6 grid-item" data-category="1" data-sort="value">
            <img alt="@lang('Successful Blog')" class="filter-img lazy-loading-img" src="{{ getImage('assets/images/frontend/blogs/' . $blog->data_values->image) }}" />
            <div class="grid-item__content">
                <h6 class="grid-item__name mb-1"><a class="text-decoration-none">@php echo strLimit(trans($blog->data_values->title),40) @endphp</a></h6>
                <p class="grid-item__desc">
                    @php echo strLimit(strip_tags($blog->data_values->description),70) @endphp
                </p>
                <a class="grid-item__link" href="{{ route('blog.details', [slug($blog->data_values->title), $blog->id]) }}"></a>
            </div>
        </div>
    @endforeach
</div> --}}

<div class="row">
    @foreach ($blogs as $blog)
<div class="col-md-3">
    <div class="card border-0 rounded-0 shadow-sm">
        <img src="{{ getImage('assets/images/frontend/blogs/' . $blog->data_values->image) }}" class="card-img-top rounded-0" alt="Blog post image">
        <div class="card-body">
          <h5 class="card-title mb-3 text-justify">@php echo strLimit(trans($blog->data_values->title),40) @endphp</h5>
          <p class="card-text text-muted text-justify">    @php echo strLimit(strip_tags($blog->data_values->description),70) @endphp</p>
          <div class="d-flex justify-content-center">
            <a href="{{ route('blog.details', [slug($blog->data_values->title), $blog->id]) }}" class="btn btn--base btn--sm">Read More</a>
          </div>
        </div>
      </div>

</div>
    @endforeach
</div>
