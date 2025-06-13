import { configureStore } from '@reduxjs/toolkit'

import authSlice from '../features/authSlice';
import bookSlice from '../features/bookSlice';
import authorSlice from '../features/authorSlice';


const Store = configureStore({
    reducer: {
        auth: authSlice,
        books: bookSlice,
        authors:authorSlice,

    }
})



export default Store;