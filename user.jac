"""Apartment Sign-In/Sign-Out Register"""

import random;
import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Provide a personalized welcome or farewell message"""
def get_message(apt_num: int, is_signing_in: bool) -> str by llm();

walker RegisterAction {
    # User is checking in/out of an apartment
    has apartment_number: int;

    can start with `root entry;
    can process_action with apt_register entry;
}

impl RegisterAction.start {
    # Check if a register node exists
    if not [root --> (`?apt_register)] {
    next = root ++> apt_register();
    } else {
        next = [root --> (`?apt_register)];
    }
    visit next;
}

impl RegisterAction.process_action {

    # occupied apartments
    occupied = here.occupied_apts;
    apt_num = self.apartment_number;

    if [-->] {
        visit [-->];
    } else {
        if apt_num in occupied {
            # Apartment is occupied: Sign Out logic
            here.occupied_apts.remove(apt_num);
            # Use LLM to generate a farewell message
            print(get_message(apt_num, False));
            print(f"Successfully **SIGNED OUT** of Apartment **{apt_num}**. Status: VACANT.");

        } else {
            # Apartment is vacant: Sign In logic
            here.occupied_apts.add(apt_num);
            
            # Use LLM to generate a welcome message
            print(get_message(apt_num, True));
            print(f"Successfully **SIGNED IN** to Apartment **{apt_num}**. Status: OCCUPIED.");
        }
        
        disengage;
    }
}

node apt_register {
    # database of currently occupied apartments
    has occupied_apts: set = {201, 203, 305};
}

with entry:__main__ {
    # Sign in to 101 (Vacant -> Occupied)
    root spawn RegisterAction(101);
    
    # Sign out of 201 (Occupied -> Vacant)
    root spawn RegisterAction(201);

    # Sign in to 305 (Occupied -> Should sign out)
    root spawn RegisterAction(305);

    # Sign in to 102 (Vacant -> Occupied)
    root spawn RegisterAction(102);
}