@extends('layouts.app')
@section('content')

<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
           <li class="breadcrumb-item"><a href="/home">Home</a></li>
           <li class="breadcrumb-item"><a href="{{ route("advice.index") }}">Advices</a></li>
           <li class="breadcrumb-item" aria-current="page">Edit advice</li>
        </ol>
     </nav>

    <h3>{{ $advice->title }}</h3>
    
    @if (count($errors) > 0)
        <div class="alert alert-danger">
            <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
            </ul>
        </div>
    @endif
    
    <form action="{{ route("advice.update", $advice->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method("PUT")
        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" name="title" class="form-control" id="title" value="{{ $advice->title }}">
        </div>
        
        <div class="form-group">
            <label for="subtitle">Title:</label>
            <input type="text" name="subtitle" class="form-control" id="subtitle" value="{{ $advice->subtitle }}">
        </div>

        <div class="form-group">
            <label for="model_name">Model name:</label>
            <input type="text" name="model_name" class="form-control" id="model_name" value="{{ $advice->model_name }}">
        </div>
        
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="text" name="price" class="form-control" id="price" value="{{ $advice->price }}">
        </div>

        <div class="form-group">
            <label for="category_id">Category:</label>
            <select name="category_id" class="form-control" id="category_id">
                @foreach($categories as $category)
                <option value="{{ $category->id }}" {{ $advice->category_id == $category->id ? 'selected' : '' }}>{{ $category->title }}</option>
                @endforeach
            </select>
        </div>

        <div class="form-group">
            <label for="title">Content:</label>
            <textarea name="content" style="width:100%;" rows="6" id="content">{{ $advice->content }}</textarea>
        </div>

        <div class="form-group">
            <label for="cover">Image:</label>
            <input type="file" name="cover" class="form-control" id="cover">
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
@endsection