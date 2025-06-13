// BookList.jsx
import React, { useEffect, useState } from 'react';
import {
  Box,
  Button,
  Divider,
  Pagination,
  Stack,
  Typography,
} from '@mui/material';
import { useDispatch, useSelector } from 'react-redux';
import { getBooks } from '../../features/bookSlice';
import { getAuthorsDropdown } from '../../features/authorSlice';
import BookItem from '../../components/common/BookItem';
import AddBookModal from '../../components/common/AddBookModal';
import CustomizedSnackbar from '../../components/common/CustomSnackBar';

const BookList = () => {

  const dispatch = useDispatch();
  const { books = [], meta = {}, loading, toastConfig } = useSelector((state) => state.books);
  const { authors = [] } = useSelector((state) => state.authors);
  const { user } = useSelector((state) => state.auth);

  const [page, setPage] = useState(1);
  const [selectedAuthor, setSelectedAuthor] = useState('');
  const [selectedAvailability, setSelectedAvailability] = useState('');

  const [showModal, setShowModal] = useState(false);

  //  Get Authors list
  useEffect(() => {
    dispatch(getAuthorsDropdown());
  }, [dispatch]);

  // Get all books
  useEffect(() => {
    dispatch(getBooks({ page, author: selectedAuthor, available: selectedAvailability }));
  }, [dispatch, page, selectedAuthor, selectedAvailability]);

  const handleAuthorChange = (event) => {
    setPage(1);
    setSelectedAuthor(event.target.value);
  };

  const handleAvailabiltyChange = (event) => {
    setPage(1);
    setSelectedAvailability(event.target.value);
  }

  // Reset all filters
  const handleReset = () => {
    setSelectedAuthor('');
    setPage(1);
  };

  let bookContent = null;
  if (loading) {
    bookContent = <Typography mt={4} align="center">Loading books...</Typography>;
  } else if (books.length === 0) {
    bookContent = <Typography mt={4} align="center">No books found.</Typography>;
  } else {
    bookContent = books.map((book) => (
      <BookItem key={book.id} book={book} />
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
        <Box sx={{ display: 'flex', width: "100%", justifyContent: 'space-between', alignItems: 'center' }}>
          <Typography variant="h5" fontWeight={600} mb={1}>
            Books
          </Typography>
        </Box>


        <Stack
          direction={{ xs: "column", md: "row" }}
          spacing={2}
          alignItems={{ xs: "stretch", md: "center" }}
          justifyContent="space-between"
          sx={{ mb: 4 }}
        >

          <Stack
            direction={{ xs: "column", md: "row" }}
            spacing={2}
            alignItems="center"
          >

            {/* Author dropdown */}
            <select
              value={selectedAuthor}
              onChange={handleAuthorChange}
              style={{
                padding: '8px',
                borderRadius: '4px',
                border: '1px solid #ccc',
                fontSize: '16px',
                minWidth: '180px',
              }}
            >
              <option value="">All Authors</option>
              {authors.map((author) => (
                <option key={author.id} value={author.name}>
                  {author.name}
                </option>
              ))}
            </select>

            {/* Availability dropdown */}
            <select
              value={selectedAvailability}
              onChange={handleAvailabiltyChange}
              style={{
                padding: '8px',
                borderRadius: '4px',
                border: '1px solid #ccc',
                fontSize: '16px',
                minWidth: '180px',
              }}
            >
              <option value="">Available Books</option>
              <option value="true">True</option>
              <option value="false">False</option>
            </select>

            {/* Reset Button */}
            <Button
              color="primary"
              variant="contained"
              type="submit"
              sx={{ padding: "5px 15px" }}
              onClick={handleReset}
            >
              Reset
            </Button>
          </Stack>

          {/* Right group (Add Book Button) */}
          {user && user.role_name === 'admin' && (
            <Button
              color="primary"
              variant="contained"
              sx={{
                padding: '5px 15px',
                alignSelf: { xs: 'stretch', md: 'auto' },
                ml: { xs: 0, md: 'auto' }, // margin-left: auto on md and up
              }}
              onClick={() => setShowModal(true)}
            >
              Add Book
            </Button>

          )}
          {showModal && <AddBookModal onClose={() => setShowModal(false)} authors={authors} />}
          {/*Custom model*/}

          {/* Custom alert */}
          {toastConfig && <CustomizedSnackbar message={toastConfig.message} variant={toastConfig.type} />}

        </Stack>

        <Divider />
        {bookContent}

        {meta?.last_page > 1 && (
          <Box display="flex" justifyContent="center" mt={4}>
            <Pagination
              count={meta.last_page}
              page={page}
              onChange={(_, val) => setPage(val)}
              color="primary"
            />
          </Box>
        )}
      </Box>
    </Box >
  );
};

export default BookList;
