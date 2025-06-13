import React, { useEffect } from 'react';
import { useParams, useNavigate, Link } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { clearToast as clearBookToast, getBookById, rentBook } from '../../features/bookSlice';
import {
  CircularProgress,
  Typography,
  Box,

  Button,
  Card,
  CardMedia,
  CardContent,

} from '@mui/material';

import CustomizedSnackbar from '../../components/common/CustomSnackBar';

const BookDetail = () => {
  const { id } = useParams();
  const dispatch = useDispatch();
  const navigate = useNavigate();

  const { selectedBook, loading, error, toastConfig } = useSelector((state) => state.books);
  const { user } = useSelector((state) => state.auth);


  const handleRent = () => {

    dispatch(rentBook(id));
    navigate('/rented-books')

  };

  useEffect(() => {
 
    dispatch(getBookById(id));

    return () => {
 
      dispatch(clearBookToast());

    };
  }, [dispatch, id]);



  if (loading) return <CircularProgress />;
  if (error) return <Typography variant='h3' textAlign={"center"} color="error">Book not found </Typography>;
  if (!selectedBook) return <Typography>No book found</Typography>;

  return (
    <Box sx={{ maxWidth: 1000, mx: 'auto', p: 3 }}>
      <Link to='/'>
        <Button variant="contained" sx={{ mb: 3 }}>
          Back to Home
        </Button>
      </Link>


      <Card sx={{ display: 'flex', flexDirection: { xs: 'column', md: 'row' } }}>
        {/* Book Image */}
        {selectedBook.image_url && (
          <CardMedia
            component="img"
            image={selectedBook.image_url}
            alt={selectedBook.title}
            sx={{ width: { xs: '100%', md: 550 }, height: '100%', objectFit: 'cover' }}
          />
        )}

        {/* Book Content */}
        <Box sx={{ flex: 1 }}>
          <CardContent>
            <Typography variant="h4" gutterBottom>
              {selectedBook.title}
            </Typography>

            <Typography variant="subtitle1" color="text.secondary" gutterBottom mb={3}>
              Author: {selectedBook.author?.name}
            </Typography>

            <Typography variant="body2" mb={3} color="text.secondary" gutterBottom>
              ISBN: {selectedBook.ISBN}
            </Typography>

            <Typography variant="body2" mb={3} color="text.secondary" gutterBottom>
              Price: ${selectedBook.price}
            </Typography>

            <Typography variant="body1" mb={3} >
              {selectedBook.description}
            </Typography>

            {user?.role_name === 'customer' && (
              <Button disabled={!selectedBook.available} variant="contained" color="primary" onClick={handleRent}>
                {selectedBook.available ? 'Rent this Book' : 'Book has been taken'}
              </Button>
            )}
          </CardContent>
          {toastConfig && (
            <CustomizedSnackbar
              message={toastConfig.message}
              variant={toastConfig.type}
            />
          )}
        </Box>
      </Card>
    </Box>
  );
};

export default BookDetail;
