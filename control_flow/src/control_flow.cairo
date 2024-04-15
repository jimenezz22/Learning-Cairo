fn main() {

    //Using if in a let Statement 

    let condition = true;
    let number = if condition {
        5
    } else {
        6
    };

    if number == 5 {
        println!("condition was true and number is {}", number);
    }

    //Using a loop to run code more than once
    //Cairo has two kinds of loops: loop and while

    //Repeating Code with loop
    //The loop keyword tells Cairo to execute a block of code over and over again forever or until you explicitly tell it to stop.
    let mut i: usize = 0;
    loop {
        if i > 10 {
            break;
        }
        if i == 5 {
            i += 1;
            continue;
        }
        println!("i = {}", i);
        i += 1;
    }

    //Returning Values from Loops
    let mut counter = 0;

    let result = loop {
        if counter == 10 {
            break counter * 2; //The value returned from the loop is counter * 2
        }
        counter += 1;
    };

    println!("The result is {}", result);

    //Conditional Loops with while
    //While the condition is true, the loop runs
    let mut number = 3;

    while number != 0 {
        println!("{number}!");
        number -= 1;
    };

    println!("LIFTOFF!!!");
}