struct User {
        active: bool,
        username: felt252,
        email: felt252,
        sign_in_count: u64,
}

//a build_user function that returns a User instance with the given email and username. 
//The active field gets the value of true, and the sign_in_count gets a value of 1.
fn build_user(email: felt252, username: felt252) -> User {
    User { active: true, username: username, email: email, sign_in_count: 1, }
}

fn main() {
    let user1 = User {
        active: true, username: 'someusername123', email: 'someone@example.com', sign_in_count: 1
    };
    let user2 = User {
        sign_in_count: 1, username: 'someusername123', active: true, email: 'someone@example.com'
    };
    let user3 = User {
        sign_in_count: 1, username: 'someusername123', active: true, email: 'someone@example.com'
    };

    //to access user1's email address, we use user1.email. If the instance is mutable, we can change a value by using the dot 
    //notation and assigning into a particular field.

    user3.email = 'anotheremail@example.com';

    
}
//The pieces of a struct can be different types. 