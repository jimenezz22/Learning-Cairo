//Cairo uses an immutable memory model, meaning that once a memory cell is written to, it can't be overwritten but only read from
//Variables in cairo are immutable by default, I'm not cant change their value

fn main(){
    let x = 5;
    println!("The value of x is: {}", x);
    //x = 6;
    //println!("The value of x is: {}", x);

    let mut y = 5;
    println!("The value of y is: {}", y);
    y = 6;
    println!("The value of y is: {}", y);

    //Costants example declaration
    struct AnyStruct {
        a: u256,
        b: u32
    }

    enum AnyEnum {
        A: felt252,
        B: (usize, u256)
    }

    const ONE_HOUR_IN_SECONDS: u32 = 3600;
    const STRUCT_INSTANCE: AnyStruct = AnyStruct {a: 0, b: 1};
    const ENUM_INSTANCE: AnyEnum = AnyEnum::A('any enum');
    const BOOL_FIXED_SIZE_ARRAY: [bool; 2] = [true, false];

    //Nonetheless, it is possible to use the consteval_int! macro to create a const variable that is the result of some computation:
    const ONE_HOUR_IN_SECONDS_CONSTEVAL: u32 = consteval_int!(60 * 60);
}

//mutability can be very useful, and can make code more convenient to write
//Adding mut in front of the variable name makes it mutable
//Assigning to a mutable variable in Cairo is essentially equivalent to redeclaring it to refer to another value in another memory cell

//---Constants---
//Constants aren’t just immutable by default.
//Constants can only be declared in the global scope, which makes them useful for values that many parts of code need to know about
//The last difference is that constants may natively be set only to a constant expression, not the result of a value that could only 
//be computed at runtime.
//Naming hardcoded values used throughout your program as constants is useful in conveying the meaning of that value to future maintainers 
//of the code. It also helps to have only one place in your code you would need to change if the hardcoded value needed to be updated 
//in the future.

