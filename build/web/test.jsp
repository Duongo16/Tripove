<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Custom Radio Button</title>
        <style>
            /* ?n radio button m?c ??nh */
            input[type="radio"] {
                display: none;
            }

            /* T?o radio button tùy ch?nh */
            .custom-radio {
                position: relative;
                display: inline-block;
                width: 25px; /* Thay ??i kích th??c */
                height: 25px; /* Thay ??i kích th??c */
                border: 2px solid #000; /* Vi?n c?a radio button */
                border-radius: 50%;
                cursor: pointer;
            }

            /* Khi radio button ???c ch?n */
            input[type="radio"]:checked + .custom-radio::after {
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                width: 60%; /* Kích th??c d?u ch?m bên trong */
                height: 60%; /* Kích th??c d?u ch?m bên trong */
                background-color: #000; /* Màu s?c c?a d?u ch?m */
                border-radius: 50%;
                transform: translate(-50%, -50%);
            }
        </style>
    </head>
    <body>

        <label>
            <input type="radio" name="example" value="1">
            <span class="custom-radio"></span>
            Option 1
        </label>

        <label>
            <input type="radio" name="example" value="2">
            <span class="custom-radio"></span>
            Option 2
        </label>

    </body>
</html>
