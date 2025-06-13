import React, { useEffect, useState } from 'react';
import { Box, Button, Grid2 as Grid, TextField } from '@mui/material';
import Prompt from '../common/Prompt';
import { useNavigate } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { register } from '../../features/authSlice';
import CustomizedSnackbar from '../common/CustomSnackBar';
import { clearToast } from '../../features/authSlice';

const RegisterForm = () => {

  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { user, toastConfig } = useSelector((state) => state.auth);
  const [loading, setLoading] = useState(false);
  const [formValues, setFormValues] = useState({
    email: '',
    password: '',
    name: '',
    password_confirmation: '',
    is_customer: true,
  });

  const [formErrors, setFormErrors] = useState({});

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormValues((prev) => ({
      ...prev,
      [name]: value,
    }));
  };

  const validateForm = () => {
    const errors = {};
    if (!formValues.name.trim()) errors.name = 'Name is required';
    if (!formValues.email.trim()) {
      errors.email = 'Email is required';
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formValues.email)) {
      errors.email = 'Invalid email format';
    }

    if (!formValues.password) errors.password = 'Password is required';
    else if (formValues.password.length < 6) errors.password = 'Password must be at least 6 characters';

    if (!formValues.password_confirmation) errors.password_confirmation = 'Please confirm your password';
    else if (formValues.password !== formValues.password_confirmation) {
      errors.password_confirmation = 'Passwords do not match';
    }

    return errors;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const errors = validateForm();
    setFormErrors(errors);

    // no errors send the informaiton to backend
    if (Object.keys(errors).length === 0) {
      setLoading(true);
      dispatch(register(formValues)).unwrap()
        .catch((error) => console.error('rejected', error))
        .finally(() => {
          setLoading(false);

        });

    }
  };


  useEffect(() => {
    if (user) {
      navigate("/");
    }
  }, [user, navigate]);

  useEffect(() => {
    return () => {
      dispatch(clearToast());
    };
  }, [dispatch]);


  return (
    <Grid size={{ xs: 12, sm: 8 }} sx={{ margin: '0 auto' }}>
      <Box
        component="form"
        sx={{ '& .MuiTextField-root': { m: 0 } }}
        noValidate
        onSubmit={handleSubmit}
      >
        <Box sx={{ marginBottom: 4 }}>
          <TextField
            fullWidth
            name="name"
            label="Name"
            value={formValues.name}
            onChange={handleChange}
            error={Boolean(formErrors.name)}
            helperText={formErrors.name}
          />
        </Box>

        <Box sx={{ marginBottom: 4 }}>
          <TextField
            fullWidth
            name="email"
            label="Email"
            value={formValues.email}
            onChange={handleChange}
            error={Boolean(formErrors.email)}
            helperText={formErrors.email}
          />
        </Box>

        <Box sx={{ marginBottom: 4 }}>
          <TextField
            fullWidth
            name="password"
            label="Password"
            type="password"
            value={formValues.password}
            onChange={handleChange}
            error={Boolean(formErrors.password)}
            helperText={formErrors.password}
          />
        </Box>

        <Box sx={{ marginBottom: 4 }}>
          <TextField
            fullWidth
            name="password_confirmation"
            label="Confirm Password"
            type="password"
            value={formValues.password_confirmation}
            onChange={handleChange}
            error={Boolean(formErrors.password_confirmation)}
            helperText={formErrors.password_confirmation}
          />
        </Box>

        <Box sx={{ marginBottom: 2 }}>


          <Button
            color="primary"
            variant="contained"
            fullWidth
            type="submit"
            sx={{ padding: "10px 0" }}
            disabled={loading}
          >
            {loading ? "Please wait..." : "Register"}
          </Button>
        </Box>

        <Prompt Messagetext="Already a User " linkText="Click here" url="/login" />

        {toastConfig && (
          <CustomizedSnackbar
            message={toastConfig.message}
            variant={toastConfig.type}
          />
        )}
      </Box>
    </Grid>
  );
};

export default RegisterForm;
