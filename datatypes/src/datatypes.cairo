fn main() {

    // addition
    let sum = 5_u128 + 10_u128;

    // subtraction
    let difference = 95_u128 - 4_u128;

    // multiplication
    let product = 4_u128 * 30_u128;

    // division
    let quotient = 56_u128 / 32_u128; //result is 1
    let quotient = 64_u128 / 32_u128; //result is 2

    // remainder
    let remainder = 43_u128 % 5_u128; // result is 3

    //---Boolean---
    let t = true;
    let f: bool = false; // with explicit type annotation

    //---Short String---
    let my_first_char = 'C';
    let my_first_char_in_hex = 0x43;

    let my_first_string = 'Hello world';
    let my_first_string_in_hex = 0x48656C6C6F20776F726C64;

    //--ByteArrayStrings--
    let long_string: ByteArray = "this is a string which has more than 31 characters";

    //---Type Casting---
    let my_felt252 = 10;
    // Since a felt252 might not fit in a u8, we need to unwrap the Option<T> type
    let my_u8: u8 = my_felt252.try_into().unwrap();
    let my_u16: u16 = my_u8.into();
    let my_u32: u32 = my_u16.into();
    let my_u64: u64 = my_u32.into();
    let my_u128: u128 = my_u64.into();
    // As a felt252 is smaller than a u256, we can use the into() method
    let my_u256: u256 = my_felt252.into();
    let my_usize: usize = my_felt252.try_into().unwrap();
    let my_other_felt252: felt252 = my_u8.into();
    let my_third_felt252: felt252 = my_u16.into();

    //---Tuple type---
    let tup: (u32, u64, bool) = (10, 20, true);

    //This is called destructuring: take tup and turn it into three separate variables
    let tup2 = (500, 6, true);
    let (x, y, z) = tup2;
    if y == 6 {
        println!("y is 6!");
    }

    //We can also declare the tuple with value and types, and destructure it at the same time
    let (w, r): (felt252, felt252) = (2, 3);
}   
//---Scalar Types--
//Represents a single value. Cairo has three primary scalar types: 
    //1. felts
        //By defaults is you not specify the type of a variable.       
    //2. integers
        //is a number without a fractional component.
        // 8-bit = u8
        // 16-bit = u16
        // 32-bit = u32 
        // 64-bit = u64
        // 128-bit = u128
        // 256-bit = u256 needs 4 more bits to be stored, is basically a struct with 2 fields: u256 {low: u128, high: u128}.
        // 32-bit = unsize
    //3. booleans
        //When declaring a bool variable, it is mandatory to use either 
        //true or false literals as value.
    
    //4. string
        //Cairo doesn't have a native type for strings but provides 
        //two ways to handle them: short strings using simple quotes 
        //and ByteArray using double quotes.

        //Short string:
            //A short string is an ASCII string where each character is encoded on one byte
            //'a' is equivalent to 0x61
            //'b' is equivalent to 0x62
            //'c' is equivalent to 0x63
            //0x616263 is equivalent to 'abc'.
            //a short string is limited to 31 characters
        
        //Byte Array Strings:
            //More than 31 characters
            //strings are written in double quotes
    
    //Type Casting
        //you can convert scalar types from one type to another by using t
        //he try_into and into methods provided by the TryInto and Into 
        //traits from the core library.

        //The try_into method allows for safe type casting when the 
        //target type might not fit the source value. Keep in mind that 
        //try_into returns an Option<T> type, which you'll need to 
        //unwrap to access the new value.

        //On the other hand, the into method can be used for type
        //casting when success is guaranteed, such as when the source 
        //type is smaller than the destination type.

        //var.into() or var.try_into() on the source value to cast it to another type.

    //---Tuple type---
        //A tuple is a general way of grouping together a number of values with a variety of types into one compound type.
        //Tuples have a fixed length: once declared, they cannot grow or shrink in size.

    //---The Unit Type ()---
        //The unit type, written as (), is a special type that is used when there is no value to return.
        //The unit type is most commonly seen implicitly: functions that don't return a value actually return the unit type.

//Notes:
//it is highly recommended for programmers to use the integer types 
//instead of the felt252 type whenever possible, as the integer types 
//come with added security features that provide extra protection against 
//potential vulnerabilities in the code, such as overflow and underflow
// checks.