fn main(){
    //---Shadowing---
    let z = 5; //This program first binds x to a value of 5
    let z = z + 1; //taking the original value and adding 1 so the value of x is then 6
    //within an inner scope
    {
        let z = z * 2; //shadows x and creates a new variable, multiplying the previous value by 2 to give x a value of 12
        println!("Inner scope z value is: {}", z);
    }
    //When that scope is over, the inner shadowing ends and x returns to being 6
    println!("Outer scope z value is: {}", z);


    //The only difference (with mut) is that by shadowing a variable, the compiler will not complain if you change its type. 
    //For example, say our program performs a type conversion between the u64 and felt252 types.
    let a: u64 = 2;
    println!("The value of a is {} of type u64", a);
    let a: felt252 = a.into(); // converts x to a felt, type annotation is required.
    println!("The value of a is {} of type felt252", a);

    //The first x variable has a u64 type while the second x variable has a felt252 type. Shadowing thus spares us from having to 
    //come up with different names, such as x_u64 and x_felt252; instead, we can reuse the simpler x name. However, if we try to 
    //use mut for this, as shown here, we’ll get a compile-time error:
    let mut b: u64 = 2;
    println!("The value of b is: {}", b);
    b = 'a short string';
    println!("The value of b is: {}", b);
    //error: The value does not fit within the range of type core::integer::u64.
}
//---Shadowing---
//Variable shadowing refers to the declaration of a new variable with the same name as a previous variable
//the first variable is shadowed by the second, which means that the second variable is what the compiler will see when you use 
//the name of the variable