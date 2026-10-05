begin
  // Variable initialization
  var direction : Integer = 0; // 0: direction unknown, 1: up, -1: down
  var changes : Cardinal = 0; // Counter for direction changes
  var new_direction : Integer = direction; // New direction
  // Floor numbers where the elevator stopped
  var prev : Cardinal; 
  var current : Cardinal; 
  var b_done : Boolean = false; // Flag variable for loop exit condition
  Console.WriteLine('Enter the floor numbers where the elevator stopped.'); 
  Console.WriteLine('0 - End of data input'); 
  // Read the first floor
  Cardinal.TryParse(Console.ReadLine(), prev); 
  b_done := (prev = 0); 
  // Loop for input and analysis
  // Data is entered until the number 0 is received
  while not b_done do
  begin
    Cardinal.TryParse(Console.ReadLine(), current); // Enter remaining floors
    b_done := (current = 0); // Exit loop if 0 is entered
    // If floors are the same, direction does not change;
    // simply skip
    if (not b_done) and (current <> prev) then
    begin
      // Determine the new current direction
      // between prev and current
      new_direction := 1; 
      if current > prev then
      begin
        new_direction := -1; 
      end; 
    end; 
    // If the direction was already known (not 0)
    // and it does not match the new direction, a change has occurred
    if (not b_done) and (direction <> 0) and (new_direction <> direction) then
    begin
      changes += 1; 
    end; 
    // Update history for the next step
    direction := new_direction; 
    prev := current; 
  end; 
  //--- Output information to the screen ----
  Console.WriteLine($'Number of elevator direction changes: {changes}'); 
  Console.Read(); // Delays output until the "Enter" key is pressed
end.