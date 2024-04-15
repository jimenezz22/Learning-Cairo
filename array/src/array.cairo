fn main() -> u128{
    //Creating an Array
    //let mut my_array = ArrayTrait::<u128>::new(); //Creating an empty array of type u128
    let mut a = ArrayTrait::new();

    //Adding elements to the array
    a.append(10);
    a.append(1);
    a.append(2);   

    //Removing Elements
    //You can only remove elements from the front of an array by using the pop_front() method. 
    //This method returns an Option that can be unwrapped, containing the removed element, or Option::None if the array is empty.
    let first_value = a.pop_front().unwrap();
    println!("The first value is {}", first_value);

    //Reading Elements from an Array
    //To access array elements, you can use get() or at() array methods that return different types. 
    //Using arr.at(index) is equivalent to using the subscripting operator arr[index].
    
    //get() Method
    //The get function returns an Option<Box<@T>>, which means it returns an option to a Box type (Cairo's smart-pointer type) 
    //containing a snapshot to the element at the specified index if that element exists in the array. If the element doesn't exist, 
    //get returns None. 
    
    let mut arr = ArrayTrait::<u128>::new();
    arr.append(100);
    let index_to_access =
       1 ; // Change this value to see different results, what would happen if the index doesn't exist?
    match arr.get(index_to_access) {
        Option::Some(x) => { // If the element exists, multiply it by 2 and print it
            *x
                .unbox() // Unbox the smart pointer to get the actual value
        // It basically means "transform what get(idx) returned into a real value"
        },
        Option::None => { panic!("out of bounds") } // If the element doesn't exist, panic
    }

    //at() Method
    //The at function, on the other hand, directly returns a snapshot to the element at the specified index using the unbox() operator 
    //to extract the value stored in a box. If the index is out of bounds, a panic error occurs. You should only use at when you want 
    //the program to panic if the provided index is out of the array's bounds, which can prevent unexpected behavior.
    let mut b = ArrayTrait::new();
    b.append(0);
    b.append(1);

    let first = *b.at(0);
    let second = *b.at(1);

    //To determine the number of elements in an array, use the len() method. The return value is of type usize.
    //to check if an array is empty or not, you can use the is_empty() method, which returns true if the array is empty and false otherwise.

    //array! Macro
    //Sometimes, we need to create arrays with values that are already known at compile time. The basic way of doing that is redundant. 
    //You would first declare the array and then append each value one by one. array! is a simpler way of doing this task by combining the 
    //two steps. At compile-time, the compiler will expand the macro to generate the code that appends the items sequentially.
     let arr = array![1, 2, 3, 4, 5];

    //If you want to store elements of different types in an array, you can use an Enum to define a custom data type that can hold multiple types.
    enum Data {
    Integer: u128,
    Felt: felt252,
    Tuple: (u32, u32),
    }
    let mut messages: Array<Data> = array![];
    messages.append(Data::Integer(100));
    messages.append(Data::Felt('hello world'));
    messages.append(Data::Tuple((10, 30)));

    //Span is a struct that represents a snapshot of an Array. It is designed to provide safe and controlled access to the elements 
    //of an array without modifying the original array.
    array.span();
}
//Note: memory is immutable, which means that it is not possible to modify the elements of an array once they've been added. 
//You can only add elements to the end of an array and remove elements from the front of an array