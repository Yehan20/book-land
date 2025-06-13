import React, { useState } from 'react';
import { Avatar, Box, Button, Typography } from '@mui/material';
import PropTypes from 'prop-types';
import { Link } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import { returnBook } from '../../features/bookSlice';

const BookItem = ({ book, type }) => {
  const [loading, setLoading] = useState(false);
  const dispatch = useDispatch();

  const handleReturn = (bookId) => {
    setLoading(true);

    dispatch(returnBook(bookId)).unwrap().catch(err=>console.log(err)).finally(()=>setLoading(false))

  };

  return (
    <Box
      sx={{
        display: 'flex',
        gap: 1,
        justifyContent: 'space-between',
        py: 2,
        borderBottom: '1px solid #eee',
        flexDirection: {
          xs: 'column', 
          md: type === 'rented' ? 'column' : 'row', 
        },
        alignItems: {
          xs: 'stretch',
          md: type === 'rented' ? 'stretch' : 'center',
        },
      }}
    >
      <Box
        sx={{
          display: 'flex',
          alignItems: 'center',
          gap: 2,
          width: { xs: '100%', md: '30%' },
        }}
      >
        <Avatar
          alt={book.title}
          src={book.image_url}
          sx={{ width: 48, height: 48 }}
        />
        <Box>
          <Typography fontWeight={600} textTransform="capitalize">
            {book.title}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            ISBN: {book.ISBN}
          </Typography>
        </Box>
      </Box>

      <Typography variant="body2" color="text.secondary">
        Rs : {book.price}
      </Typography>

      <Typography variant="body2" color="text.secondary">
        Author: {book.author.name || 'Unknown'}
      </Typography>

      <Typography variant="body2">
        Available:{' '}
        <span style={{ color: book.available ? 'green' : 'red' }}>
          {book.available ? 'Yes' : 'No'}
        </span>
      </Typography>

      {type === 'rented' && (
        <>
          <Typography variant="body2" color="text.secondary">
            Date of borrow: {book.date_of_borrow}
          </Typography>

          <Typography variant="body2" color="text.secondary">
            Deadline: {book.deadline}
          </Typography>

          <Typography variant="body2" color="text.secondary">
            Returned: {book.is_returned ? 'Yes' : 'No'}
          </Typography>

          <Button
            variant='contained'
            sx={{ padding: "2px 5px", width: '150px', textAlign: 'start' }}
            onClick={() => handleReturn(book.id)}
            disabled={loading}
          >
            {loading ? "Please wait." : "Return book"}
          </Button>
        </>
      )}

      <Link to={`/books/${book.id}`}>
        <Typography variant="body2" color="green" >View details</Typography>
      </Link>
    </Box>

  );
};

BookItem.propTypes = {
  book: PropTypes.shape({
    title: PropTypes.string,
    ISBN: PropTypes.string,
    price: PropTypes.number,
    image_url: PropTypes.string,
    id: PropTypes.oneOfType([PropTypes.string, PropTypes.number]),
    author: PropTypes.object,
    available: PropTypes.bool,

    date_of_borrow: PropTypes.string,
    deadline: PropTypes.string,
    is_returned: PropTypes.bool,
  }).isRequired,

  type: PropTypes.string
};

export default BookItem;
