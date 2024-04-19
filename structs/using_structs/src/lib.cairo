// let’s write a program that calculates the area of a rectangle
//We’ll start by using single variables, and then refactor the program until we’re using structs instead.

fn main() {
    let width1 = 30;
    let height1 = 10;
    let area = area(width1, height1);
    println!("Area is {}", area);
}

fn area(width: u64, height: u64) -> u64 {
    width * height
}

//The issue with this code is evident in the signature of area
//The area function is supposed to calculate the area of one rectangle, but the function we wrote has two parameters, 
//and it’s not clear anywhere in our program that the parameters are related. It would be more readable and more manageable 
//to group width and height together

//Refactoring with Tuples

fn main() {
    let rectangle = (30, 10);
    let area = area(rectangle);
    println!("Area is {}", area);
}

fn area(dimension: (u64, u64)) -> u64 {
    let (x, y) = dimension;
    x * y
}

//Tuples let us add a bit of structure, and we’re now passing just one argument. But in another way, this version is less clear: 
//tuples don’t name their elements, so we have to index into the parts of the tuple, making our calculation less obvious.

//Refactoring with Structs: Adding More Meaning
//We use structs to add meaning by labeling the data. 

struct Rectangle {
    width: u64,
    height: u64,
}

fn main() {
    let rectangle = Rectangle { width: 30, height: 10, };
    let area = area(rectangle);
    println!("Area is {}", area);
}

fn area(rectangle: Rectangle) -> u64 {
    rectangle.width * rectangle.height
}

//Our area function is now defined with one parameter, which we’ve named rectangle which is of type Rectangle struct. 
//We can then access the fields of the instance with dot notation, and it gives descriptive names to the values rather 
//than using the tuple index values of 0 and 1.