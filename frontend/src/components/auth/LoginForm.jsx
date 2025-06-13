import { Box, Button, Grid2 as Grid, TextField } from '@mui/material';
import React, { useEffect, useState } from 'react';
import Prompt from '../common/Prompt';
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from 'react-redux';
import { clearToast, login } from '../../features/authSlice';
import CustomizedSnackbar from '../common/CustomSnackBar';

const LoginForm = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { user, toastConfig } = useSelector((state) => state.auth);

  const [loading, setLoading] = useState(false);
  const [formErrors, setFormErrors] = useState({});
  const [formValues, setFormValues] = useState({
    email: '',
    password: '',
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormValues(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const validateForm = () => {
    const errors = {};
    if (!formValues.email.trim()) {
      errors.email = 'Email is required';
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formValues.email)) {
      errors.email = 'Invalid email format';
    }

    if (!formValues.password.trim()) {
      errors.password = 'Password is required';
    }

    return errors;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const errors = validateForm();
    setFormErrors(errors);

    if (Object.keys(errors).length === 0) {
      setLoading(true);
      dispatch(login(formValues))
        .unwrap()
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
    <Grid sx={{ display: "flex", alignItems: "center", margin: "0 auto" }} size={{ xs: 12, sm: 8 }}>
      <Box
        component="form"
        sx={{ "& .MuiTextField-root": { m: 0 }, width: "100%" }}
        noValidate
        onSubmit={handleSubmit}
      >
        <Box sx={{ marginBottom: 4 }}>
          <TextField
            fullWidth
            id="email"
            name="email"
            label="Email"
            required
            value={formValues.email}
            onChange={handleChange}
            error={Boolean(formErrors.email)}
            helperText={formErrors.email}
          />
        </Box>

        <Box sx={{ marginBottom: 4 }}>
          <TextField
            fullWidth
            id="password"
            name="password"
            label="Password"
            type="password"
            required
            value={formValues.password}
            onChange={handleChange}
            error={Boolean(formErrors.password)}
            helperText={formErrors.password}
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
            {loading ? "Please wait..." : "Login"}
          </Button>
        </Box>

        <Prompt
          Messagetext={"Not Registered yet "}
          linkText={"Click here"}
          url={"/register"}
        />

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

export default LoginForm;
