#!/bin/bash

# Function to display the main menu for the Medical File System
medical_file_menu() {
    while true; do
        clear
        echo "=========================================================================="
        echo "----------------------- Medical File System ------------------------------"
        echo "=========================================================================="
        echo "Welcome! The Main Menu is given below:"
        echo "1 - List all Medical Records"
        echo "2 - Create a New Medical Record"
        echo "3 - Delete a Medical Record"
        echo "4 - Rename a Medical Record"
        echo "5 - Edit Medical Record Content"
        echo "6 - Search for a Medical Record"
        echo "7 - View Medical Record Content"
        echo "0 - Exit"
        echo "=========================================================================="
        echo -n "Enter your choice (0-7): "
        read choice

        case $choice in
            1)
                echo "Listing all medical records in the current folder:"
                ls -lh
                ;;
            2)
                echo -n "Enter the name of the new medical record: "
                read record_name
                touch "$record_name"
                echo "Medical record '$record_name' created successfully."
                ;;
            3)
                echo -n "Enter the name of the medical record to delete: "
                read record_name
                if [ -f "$record_name" ]; then
                    rm "$record_name"
                    echo "Medical record '$record_name' deleted successfully."
                else
                    echo "Medical record '$record_name' does not exist."
                fi
                ;;
            4)
                echo -n "Enter the name of the medical record to rename: "
                read old_name
                if [ -f "$old_name" ]; then
                    echo -n "Enter the new name for the medical record: "
                    read new_name
                    mv "$old_name" "$new_name"
                    echo "Medical record renamed to '$new_name'."
                else
                    echo "Medical record '$old_name' does not exist."
                fi
                ;;
            5)
                echo -n "Enter the name of the medical record to edit: "
                read record_name
                if [ -f "$record_name" ]; then
                    nano "$record_name"
                else
                    echo "Medical record '$record_name' does not exist."
                fi
                ;;
            6)
                echo -n "Enter the name of the medical record to search for: "
                read record_name
                if [ -f "$record_name" ]; then
                    echo "Medical record '$record_name' found in the current directory."
                else
                    echo "Medical record '$record_name' does not exist in the current directory."
                fi
                ;;
            7)
                echo -n "Enter the name of the medical record to view: "
                read record_name
                if [ -f "$record_name" ]; then
                    echo "Content of '$record_name':"
                    cat "$record_name"
                else
                    echo "Medical record '$record_name' does not exist."
                fi
                ;;
            0)
                echo "Exiting Medical File System. Do you want to switch to the Medical Store Management System? (y/n)"
                read switch_choice
                if [[ "$switch_choice" == "y" || "$switch_choice" == "Y" ]]; then
                    medical_store_management
                else
                    echo "Goodbye!"
                    exit
                fi
                ;;
            *)
                echo "Invalid choice. Please try again."
                ;;
        esac
        echo "=========================================================================="
        echo "Press Enter to continue..."
        read
    done
}

# Function for Medical Store Management System
medical_store_management() {
    while true; do
        clear
        echo "********* Welcome to the Medicine Store ***********"
        echo " "

        echo "Medicine List"
        echo "---------Medicine Name -------Amount-------Price--------"
        echo "1)         Napa                 120mg        10 Tk"
        echo "2)         Fexo                 150mg        60 Tk"
        echo "3)         Zimax                500mg       150 Tk"
        echo "4)         Max_pro              500mg       120 Tk"
        echo "5)         Napa Extra           500mg        30 Tk"
        echo "6)         Moxibac              500mg       200 Tk"

        echo "How many types of medicines do you want to buy?"
        read count

        total_price=0

        for ((i=1; i<=count; i++))
        do
            echo "Enter your choice for medicine $i (1-6):"
            read choice

            case $choice in
                1)
                    echo "How many packs of Napa 120mg do you want?"
                    read napa_qty
                    price=$((napa_qty * 10))
                    ;;
                2)
                    echo "How many packs of Fexo 150mg do you want?"
                    read fexo_qty
                    price=$((fexo_qty * 60))
                    ;;
                3)
                    echo "How many packs of Zimax 500mg do you want?"
                    read zimax_qty
                    price=$((zimax_qty * 150))
                    ;;
                4)
                    echo "How many packs of Max_pro 500mg do you want?"
                    read maxpro_qty
                    price=$((maxpro_qty * 120))
                    ;;
                5)
                    echo "How many packs of Napa Extra 500mg do you want?"
                    read napaextra_qty
                    price=$((napaextra_qty * 30))
                    ;;
                6)
                    echo "How many packs of Moxibac 500mg do you want?"
                    read moxibac_qty
                    price=$((moxibac_qty * 200))
                    ;;
                *)
                    echo "Invalid choice! Skipping."
                    price=0
                    ;;
            esac
            
            total_price=$((total_price + price))
        done

        echo " "

        echo "Your total bill is: $total_price Tk"
        echo "Please pay your bill and collect your medicine."
        echo "Thank you. Please come again and take our service!"

        echo "Do you want to return to the main menu of the Medical File System? (y/n)"
        read return_choice
        if [[ "$return_choice" == "y" || "$return_choice" == "Y" ]]; then
            medical_file_menu
        else
            echo "Goodbye!"
            exit
        fi
    done
}

# Start with the Medical File System
medical_file_menu
