fn calculate_area(width: u32, height: u32) -> u32 {
  // Calculate the area
  let area = width * height;
  // Return the calculated area
  return area;
}

fn main() -> () {
  // Define width and height
  let width = 50;
  let height = 100;

  // Call the calculate_area function and store the returned value
  let area = calculate_area(width: width, height: height);

  // Print the calculated area
  println!("Area: {}", area);
}

//The calculate_area function takes two arguments, width and height, both of type u32 (unsigned 32-bit integer)
//The function explicitly declares a return type of u32 using the arrow (->). This indicates that the function 
//will return a value of type u32