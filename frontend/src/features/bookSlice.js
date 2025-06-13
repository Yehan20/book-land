import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
import axios from '../services/axios';

const API_ENDPOINT = 'books';

// Async thunks
export const getBooks = createAsyncThunk(
  'books/getBooks',
  async ({ page = 1, author = '', available = '' } = {}, thunkAPI) => {
    try {
      let url = `${API_ENDPOINT}?page=${page}`;
      if (author) {
        url += `&author=${encodeURIComponent(author)}`;
      }
      if (available) {
        url += `&available=${encodeURIComponent(available)}`;
      }
      const res = await axios.get(url);
      return res.data;
    } catch (err) {
      console.log(err)
      return thunkAPI.rejectWithValue(err.response?.data ?? {message:'Something went wrong',errors:[]});
    }
  }
);

export const getBookById = createAsyncThunk('books/getBookById', async (id, thunkAPI) => {

  console.log('get books bu id');
  try {
    const res = await axios.get(`${API_ENDPOINT}/${id}`);
    console.log(res.data);
    return res.data;
  } catch (err) {

    return thunkAPI.rejectWithValue(err.response.data ?? {message:'Something went wrong',errors:[]});
  }
});

export const createBook = createAsyncThunk(
  'books/createBook',
  async (formData, thunkAPI) => {
    try {
      const res = await axios.post('books', formData, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      });
      return res.data;
    } catch (err) {
      console.log(err)
      return thunkAPI.rejectWithValue(err.response.data ?? {message:'Something went wrong',errors:[]});
    }
  }
);

export const updateBook = createAsyncThunk('books/updateBook', async ({ id, data }, thunkAPI) => {
  try {
    const res = await axios.put(`${API_ENDPOINT}/${id}`, data);
    return res.data;
  } catch (err) {
    console.log(err)
    return thunkAPI.rejectWithValue(err.response.data ?? {message:'Something went wrong',errors:[]});
  }
});

export const deleteBook = createAsyncThunk('books/deleteBook', async (id, thunkAPI) => {
  try {
    await axios.delete(`${API_ENDPOINT}/${id}`);
    return id;
  } catch (err) {
    console.log(err)
    return thunkAPI.rejectWithValue(err.response?.data ?? {message:'Something went wrong',errors:[]});
  }
});

export const rentBook = createAsyncThunk('books/rentBook', async (id, { rejectWithValue }) => {
  try {
    const response = await axios.post(`${API_ENDPOINT}/${id}/rent`);
    return response.data;
  } catch (err) {
    console.log(err)
    return rejectWithValue(err.response?.data ?? {message:'Something went wrong',errors:[]});
  }
});

export const getRentedBooks = createAsyncThunk(
  'books/getRentedBooks',
  async ({ page = 1 } = {}, thunkAPI) => {
    try {
      const res = await axios.get(`${API_ENDPOINT}/rented?page=${page}`);
      return res.data;
    } catch (err) {
      console.log(err)
      return thunkAPI.rejectWithValue(err.response?.data ?? {message:'Something went wrong',errors:[]});
    }
  }
);

export const returnBook = createAsyncThunk(
  'books/returnBook',
  async (id, thunkAPI) => {
    try {
      const res = await axios.patch(`${API_ENDPOINT}/${id}/return`);
      return res.data; // assuming the updated book is returned
    } catch (err) {
      console.log(err)
      return thunkAPI.rejectWithValue(err.response?.data ?? {message:'Something went wrong',errors:[]});
    }
  }
);


const initialState = {
  books: [],
  selectedBook: null,
  loading: false,
  errors: null,
  meta: null,
  toastConfig: null,
  rentedBooks: [],
  rentedMeta: null,
};

const bookSlice = createSlice({
  name: 'books',
  initialState,
  reducers: {
    resetBookState: (state) => {
      state.selectedBook = null;
      state.errors = null;
    },
    clearToast: (state) => {
      state.toastConfig = null;
    },
  },
  extraReducers: (builder) => {
    builder
      // Get Books
      .addCase(getBooks.pending, (state) => {
        state.loading = true;
        state.errors = null;
      })
      .addCase(getBooks.fulfilled, (state, action) => {
        state.loading = false;
        state.books = action.payload.data;
        state.meta = action.payload.meta;
      })
      .addCase(getBooks.rejected, (state, action) => {
        state.loading = false;
        state.errors = action.payload;
      })

      // Get Book By ID
      .addCase(getBookById.pending, (state) => {
        state.loading = true;
        state.errors = null;
      })
      .addCase(getBookById.fulfilled, (state, action) => {
        console.log('action', action.payload);
        state.selectedBook = action.payload.data;
        state.loading = false;
      })
      .addCase(getBookById.rejected, (state, action) => {
        state.loading = false;

        state.errors = { ...action.payload }
      })

      
      // Create  a Book
      .addCase(createBook.pending, (state) => {
        state.toastConfig = null;
      })
      .addCase(createBook.fulfilled, (state, action) => {
        state.books.unshift(action.payload.data);
        state.toastConfig = {
          message: 'Book added successfully',
          type: 'success',
        };
      })
      .addCase(createBook.rejected, (state, action) => {
        state.errors = action.payload.errors;
        state.toastConfig = {
          message: action.payload.message,
          type: 'error',
        };
      })

      // Rent a  Book
      .addCase(rentBook.fulfilled, (state, action) => {
        state.selectedBook = { ...action.payload.data };
        state.toastConfig = {
          message: 'Book Rented ',
          type: 'success',
        };
      })
      .addCase(rentBook.rejected, (state, action) => {
        state.errors = action.payload.message;
        state.toastConfig = {
          message: action.payload.message,
          type: 'error',
        };
      })

      // Get Rented Books
      .addCase(getRentedBooks.pending, (state) => {
        state.loading = true;
        state.errors = null;
      })
      .addCase(getRentedBooks.fulfilled, (state, action) => {
        state.loading = false;
        state.rentedBooks = action.payload.data;
        state.rentedMeta = action.payload.meta;
      })
      .addCase(getRentedBooks.rejected, (state, action) => {
        state.loading = false;
        state.errors = action.payload;
      })

      // Return rented book
      .addCase(returnBook.pending, (state) => {

        state.errors = null;
        state.toastConfig= null;
      })
      .addCase(returnBook.fulfilled, (state, action) => {

        // Delete from array of returned nooks
        console.log('action', action.payload);
        state.rentedBooks = state.rentedBooks.filter(
          (book) => book.id !== action.payload.data.id
        );

        // verify returned book is a member of the books and update the data to sync
        const index = state.books.findIndex((book) => book.id === action.payload.data.id);
        if (index !== -1) {
          state.books[index] = action.payload.data;
        }

        state.toastConfig = {
          message: 'Book returned successfully',
          type: 'success',
        };


      })
      .addCase(returnBook.rejected, (state, action) => {

        state.errors = action.payload;
        state.toastConfig = {
          message: action.payload.message,
          type: 'error',
        };

      });
  },
});

export const { resetBookState, clearToast } = bookSlice.actions;
export default bookSlice.reducer;
