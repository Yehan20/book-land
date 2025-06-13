import { createAsyncThunk, createSlice } from '@reduxjs/toolkit';
import axios from '../services/axios';

export const getAuthorsDropdown = createAsyncThunk(
  'authors/getDropdown',
  async (_, thunkAPI) => {
    try {
      const res = await axios.get('authors/dropdown');
      return res.data;
    } catch (err) {
      return thunkAPI.rejectWithValue(err.response?.data ?? {message:'Something went wrong',errors:[]});
    }
  }
);

const authorSlice = createSlice({
  name: 'authors',
  initialState: {
    authors: [],
    loading: false,
    error: null,
  },
  extraReducers: (builder) => {
    builder
      .addCase(getAuthorsDropdown.pending, (state) => {
        state.loading = true;
        state.error = null;
      })
      .addCase(getAuthorsDropdown.fulfilled, (state, action) => {
        state.loading = false;
        state.authors = action.payload.data;
      })
      .addCase(getAuthorsDropdown.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.message;
      });
  },
});

export default authorSlice.reducer;
