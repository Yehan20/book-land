import React, { useEffect, useState } from 'react';
import {
  Box,
  Typography,
  Pagination,
  Divider,
} from '@mui/material';
import { useDispatch, useSelector } from 'react-redux';
import { getRentedBooks, clearToast } from '../../features/bookSlice';
import BookItem from '../../components/common/BookItem';
import CustomSnackbar from '../../components/common/CustomSnackBar';


const RentedBooks = () => {
  const dispatch = useDispatch();

  const { rentedBooks = [], rentedMeta = {}, loading, toastConfig } = useSelector((state) => state.books);
  const [page, setPage] = useState(1);

  // Fetch rented books
  useEffect(() => {
    dispatch(getRentedBooks({ page }));
    return () => {

      dispatch(clearToast());
    };
  }, [dispatch, page]);

  let content;
  if (loading) {
    content = <Typography mt={4} align="center">Loading rented books...</Typography>;
  } else if (rentedBooks.length === 0) {
    content = <Typography mt={4} align="center">No rented books found.</Typography>;
  } else {
    content = rentedBooks.map((book) => (
      <BookItem key={book.id} book={book} type={'rented'} />
    ));
  }

  return (
    <Box sx={{ backgroundColor: '#e6f3f7', py: 4, mt: 6, minHeight: '100vh' }}>
      <Box
        sx={{
          maxWidth: '1050px',
          mx: 'auto',
          backgroundColor: '#fff',
          borderRadius: 2,
          p: 4,
        }}
      >
        <Typography variant="h5" fontWeight={600} mb={2}>
          Rented Books
        </Typography>

        <Divider sx={{ mb: 2 }} />

        {content}

        {rentedMeta?.last_page > 1 && (
          <Box display="flex" justifyContent="center" mt={4}>
            <Pagination
              count={rentedMeta.last_page}
              page={page}
              onChange={(_, val) => setPage(val)}
              color="primary"
            />
          </Box>
        )}
      </Box>

      {toastConfig && (
        <CustomSnackbar
          open={true}
          message={toastConfig.message}
          type={toastConfig.type}
        />
      )}
    </Box>
  );
};

export default RentedBooks;
