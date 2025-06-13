import { createAsyncThunk, createSlice } from '@reduxjs/toolkit';
import axios from '../services/axios';

// Login
export const login = createAsyncThunk('auth/login', async (credentials, { rejectWithValue }) => {
    try {
        const response = await axios.post('login', credentials);
        return response.data;
    } catch (error) {
        console.log(error.response.data);
        return rejectWithValue(error.response.data);
    }
});

// Register
export const register = createAsyncThunk('auth/register', async (credentials, { rejectWithValue }) => {
    try {
        const response = await axios.post('register', credentials);
        return response.data;
    } catch (error) {
        return rejectWithValue(error.response.data);
    }
});

// Current user
export const getUser = createAsyncThunk('auth/user', async () => {
    try {
        const response = await axios.get('user'); // Assuming route is protected with auth:api or sanctum
        return response.data;
    } catch (error) {
        console.log(error);
        return error.response.data
    }
});

// Logout user
export const logoutUser = createAsyncThunk('auth/logout', async (_, { rejectWithValue }) => {
    try {
        const response = await axios.post('/logout'); // Laravel should handle clearing the JWT cookie here
        return response.data;
    } catch (error) {
        console.log(error);
        return rejectWithValue(error.response.data);
    }
});


const initialState = {
    user: null,
    loading: false,
    toastConfig: null,
    errors: null
};


const authSlice = createSlice({
    name: 'auth',
    initialState,
    reducers: {
        clearToast: (state) => {
            state.toastConfig = null;
        },
        clearErrors: (state) => {
            state.errors = null;
        },


    },
    extraReducers: (builder) => {
        builder

            // Login
            .addCase(login.pending, (state) => {

                state.toastConfig = null
                state.errors = null
            })
            .addCase(login.fulfilled, (state, action) => {

                if (action.payload) {
                 
                    state.user = action.payload.data
                    state.toastConfig = {
                        message: 'logged in',
                        type: 'success',
                    };

                }
            })
            .addCase(login.rejected, (state, action) => {

                if (!action.payload.errors) {
                    state.toastConfig = {
                        message: action.payload.message,
                        type: 'error',
                    };
                } else {
                    state.errors = action.payload.errors
                }

            })

            // Register
            .addCase(register.pending, (state) => {
                state.toastConfig = null
                state.errors = null
            })
            .addCase(register.fulfilled, (state, action) => {
                if (action.payload) {
                    state.user = action.payload.user;

                    state.toastConfig = {
                        message: 'User created',
                        type: 'success',
                    };
                }
            })
            .addCase(register.rejected, (state, action) => {

                state.toastConfig = {
                    message: action.payload.message,
                    type: 'error',
                };

                state.errors = action.payload.errors

            })


            // Get User
            .addCase(getUser.pending, (state) => {
                state.loading = true;
            })
            .addCase(getUser.fulfilled, (state, action) => {
                state.loading = false;
                if (action.payload.data) {
                    state.user = action.payload.data;
                }
            })
            .addCase(getUser.rejected, (state) => {
                state.loading = false;
                state.user = null;;
            })

            //  Logout 
            .addCase(logoutUser.fulfilled, (state) => {
                state.user = null;
                state.toastConfig = {
                    message: 'you have logged out ',
                    type: 'success',
                };
            })
            .addCase(logoutUser.rejected, (state, action) => {
                state.toastConfig = {
                    message: action.payload.message,
                    type: 'error',
                };
            });

    },
});

export default authSlice.reducer;
export const { clearToast, clearErrors } = authSlice.actions;
