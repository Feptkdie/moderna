<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Http\Request;

use App\Models\User;
use App\Models\Advice;
use App\Models\Banner;
use App\Models\Category;
use Validator;
use Storage;
use JWTAuth;


class ApiController extends Controller
{
    
    public function get_data(){
        
        // Get all data
        $advices = Advice::all();
        $categories = Category::all();
        $banners = Banner::all();

        // Creating temp array
        $r_items = array();

        $i = 0;
        $j = 0;

        foreach($categories as $category){
            $r_items[$i]["id"] = $category->id;
            $r_items[$i]["title"] = $category->title;
            $r_items[$i]["image"] = $category->image;
            $j = 0;
            foreach($advices as $advice){
                if ($category->id == $advice->category_id){
                    $r_items[$i]["advice"][$j] = $advice;
                    $j++;
                }
            }
            $i++;
        }

        return response()->json(['status' => true,'message' => 'Found data', "data"=> $r_items, "categories" => $categories,
        "banners" => $banners]);
    }

    private function check_user(){
        try {

            if (! $user = JWTAuth::parseToken()->authenticate()) {
                    return response()->json(['user_not_found'], 404);
            }

            } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {

                    return response()->json(['token_expired'], $e->getStatusCode());

            } catch (Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {

                    return response()->json(['token_invalid'], $e->getStatusCode());

            } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {

                    return response()->json(['token_absent'], $e->getStatusCode());

        }
    }
}
