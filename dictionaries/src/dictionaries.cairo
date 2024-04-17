fn main() {
    let mut balances: Felt252Dict<u64> = Default::default(); // Create a new dictionary with u64 values
    //it seems like it's a dictionary-like data structure that associates keys of type char (because 'Alex' is being used as a key) 
    //with values of type u64 (unsigned 64-bit integer).

    // Insert Alex with 100 balance
    balances.insert('Alex', 100); 
    // Check that Alex has indeed 100 associated with him
    let alex_balance = balances.get('Alex');
    assert!(alex_balance == 100, "Alex balance is not 100");
    // This line asserts that the balance retrieved for 'Alex' is equal to 100. If it's not, it will panic with the message "Alex balance is not 100".

    // Insert Alex again, this time with 200 balance
    balances.insert('Alex', 200);
    // Check the new balance is correct
    let alex_balance_2 = balances.get('Alex');
    assert!(alex_balance_2 == 200, "Alex balance is not 200");-

}


//In Cairo, the key type is restricted to felt252, leaving only the possibility to specify the value data type, 
//represented by T in Felt252Dict<T>.
//insert(felt252, T) -> () to write values to a dictionary instance and
//get(felt252) -> T to read values from it.

//How dictionaries are implemented in Cairo?
//Dictionaries are implemented as a list of key-value pairs, where each key-value pair is stored in a separate cell.
//The key-value pairs are stored in the order they are inserted, and the keys are stored in a separate list.
//When you instantiate a Felt252Dict<T>, behind the scenes all keys have their associated values initialized as zero.
//This means that if for example, you tried to get the balance of an inexistent user you will get 0 instead of an error or an undefined value.

//One of the constraints of Cairo's non-deterministic design is that its memory system is immutable, so in order to simulate mutability, 
//the language implements Felt252Dict<T> as a list of entries. Each of the entries represents a time when a dictionary was accessed for 
//reading/updating/writing purposes. An entry has three fields:
    //A key field that identifies the key for this key-value pair of the dictionary.
    //A previous_value field that indicates which previous value was held at key.
    //A new_value field that indicates the new value that is held at key.

//---Dictionaries Underneath--

//If we try implementing Felt252Dict<T> using high-level structures we would internally define it as Array<Entry<T>> 
//where each Entry<T> has information about what key-value pair it represents and the previous and new values it holds. 
//The definition of Entry<T> would be:
    //struct Entry<T> {
    //    key: felt252,
    //    previous_value: T,
    //    new_value: T,
    //}
    //A get would register an entry where there is no change in state, and previous and new values are stored with the same value.
    //An insert would register a new Entry<T> where the new_value would be the element being inserted, and the previous_value the last 
    //element inserted before this. In case it is the first entry for a certain key, then the previous value will be zero.

    //The use of this entry list shows how there isn't any rewriting, just the creation of new memory cells per Felt252Dict<T> 
    //interaction. Let's show an example of this using the balances dictionary from the previous section and inserting the users 'Alex' 
    //and 'Maria':

    //balances.insert('Alex', 100_u64);
    //balances.insert('Maria', 50_u64);
    //balances.insert('Alex', 200_u64);
    //balances.get('Maria');

    //These instructions would then produce the following list of entries:
    //	key	    |	previous |	new
    //  Alex    |   0		 |  100
    //  Maria	|   0		 |  50
    //  Alex	|   100		 |  200
    //  Maria	|   50		 |  50