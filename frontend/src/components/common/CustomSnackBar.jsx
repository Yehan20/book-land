import * as React from 'react';
import Button from '@mui/material/Button';
import Snackbar from '@mui/material/Snackbar';
import Alert from '@mui/material/Alert';
import PropTypes from 'prop-types';


CustomizedSnackbar.propTypes = {

    variant: PropTypes.string.isRequired,
    message: PropTypes.string.isRequired
};

export default function CustomizedSnackbar({ message, variant }) {
    const [open, setOpen] = React.useState(true);

    // const handleClick = () => {
    //     setOpen(true);
    // };


    const handleClose = (event, reason) => {
        if (reason === 'clickaway') {
            return;
        }

        setOpen(false);
    };

    return (
        <div>
            <Snackbar open={open} autoHideDuration={2000} onClose={handleClose}
                anchorOrigin={{ vertical: 'top', horizontal: 'right' }}
            >
                <Alert
                    onClose={handleClose}
                    severity={variant}
                    variant="filled"
                    sx={{ width: '100%' }}
                >
                    {message}
                </Alert>
            </Snackbar>
        </div>
    );



}

