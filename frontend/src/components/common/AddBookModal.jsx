import { useState, useRef } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { createBook } from '../../features/bookSlice';
import {
  TextField,
  Button,
  Typography,
  Box,
  Paper,
  MenuItem,
  Stack,
  Popper,
  MenuList,
  ClickAwayListener,
  Grow,
  
} from '@mui/material';

const genres = [
  'fantasy',
  'science fiction',
  'mystery',
  'thriller',
  'romance',
  'historical fiction',
  'horror',
];

const AddBookModal = ({ onClose }) => {
  const dispatch = useDispatch();
  const { authors, loading } = useSelector(state => state.authors);

  const [form, setForm] = useState({
    author_id: '',
    title: '',
    ISBN: '',
    price: '',
    genre: '',
    description: '',
  });

  const [image, setImage] = useState(null);
  const anchorRefAuthor = useRef(null);
  const anchorRefGenre = useRef(null);
  const [openAuthorSelect, setOpenAuthorSelect] = useState(false);
  const [openGenreSelect, setOpenGenreSelect] = useState(false);
  const [bookLoading, setBookLoading] = useState(false);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm(prev => ({ ...prev, [name]: value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const data = new FormData();
    Object.entries(form).forEach(([key, val]) => data.append(key, val));
    data.append('available', 1);
    if (image) data.append('book_image', image);

    setBookLoading(true);

    dispatch(createBook(data)).unwrap().then((res) => {
      if (!res.error) onClose()
    }).catch((error) => console.error('rejected', error))
      .finally(() => {

        setBookLoading(false);

      });
  };

  return (
    <Box
      sx={{
        position: 'fixed',
        top: 0,
        left: 0,
        width: '100%',
        height: '100%',
        bgcolor: 'rgba(0,0,0,0.5)',
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        zIndex: 1300,
        p: 2,
      }}
    >
      <Paper
        elevation={4}
        sx={{
          width: '100%',
          maxWidth: 900,
          maxHeight: '90vh',
          overflowY: 'auto',
          borderRadius: 2,
          p: { xs: 2, sm: 4 },
          backgroundColor: 'background.paper',
        }}
      >
        <Typography variant="h6" gutterBottom>Add New Book</Typography>

        <form onSubmit={handleSubmit}>
          <Stack spacing={2}>
            <Box sx={{ display: 'flex', gap: 2, flexDirection: { xs: 'column', sm: 'row' } }}>
              <Box sx={{ flexGrow: 1 }}>
                <Button
                  ref={anchorRefAuthor}
                  onClick={() => setOpenAuthorSelect(prev => !prev)}
                  variant="outlined"
                  fullWidth
                  sx={{ justifyContent: 'space-between', height: '56px' }}
                >
                  {authors.find(a => a.id === form.author_id)?.name || 'Select Author'}
                </Button>
                <Popper open={openAuthorSelect} anchorEl={anchorRefAuthor.current} transition disablePortal sx={{ zIndex: 1400 }}>
                  {({ TransitionProps }) => (
                    <Grow {...TransitionProps}>
                      <Paper sx={{ mt: 1, width: anchorRefAuthor.current?.clientWidth }}>
                        <ClickAwayListener onClickAway={() => setOpenAuthorSelect(false)}>
                          <MenuList>
                            {authors.map((a) => (
                              <MenuItem key={a.id} onClick={() => {
                                setForm(prev => ({ ...prev, author_id: a.id }));
                                setOpenAuthorSelect(false);
                              }}>
                                {a.name}
                              </MenuItem>
                            ))}
                          </MenuList>
                        </ClickAwayListener>
                      </Paper>
                    </Grow>
                  )}
                </Popper>
              </Box>

              <TextField fullWidth label="Title" name="title" value={form.title} onChange={handleChange} required />
            </Box>

            <Box sx={{ display: 'flex', gap: 2, flexDirection: { xs: 'column', sm: 'row' } }}>
              <TextField fullWidth label="ISBN" name="ISBN" value={form.ISBN} onChange={handleChange} required />
              <TextField fullWidth type="number" label="Price" name="price" value={form.price} onChange={handleChange} required />
            </Box>

            <Box sx={{ flexGrow: 1 }}>
              <Button
                ref={anchorRefGenre}
                onClick={() => setOpenGenreSelect(prev => !prev)}
                variant="outlined"
                fullWidth
                sx={{ justifyContent: 'space-between', height: '56px' }}
              >
                {form.genre || 'Select Genre'}
              </Button>
              <Popper open={openGenreSelect} anchorEl={anchorRefGenre.current} transition disablePortal sx={{ zIndex: 1400 }}>
                {({ TransitionProps }) => (
                  <Grow {...TransitionProps}>
                    <Paper sx={{ mt: 1, width: anchorRefGenre.current?.clientWidth }}>
                      <ClickAwayListener onClickAway={() => setOpenGenreSelect(false)}>
                        <MenuList>
                          {genres.map((g) => (
                            <MenuItem key={g} onClick={() => {
                              setForm(prev => ({ ...prev, genre: g }));
                              setOpenGenreSelect(false);
                            }}>
                              {g}
                            </MenuItem>
                          ))}
                        </MenuList>
                      </ClickAwayListener>
                    </Paper>
                  </Grow>
                )}
              </Popper>
            </Box>

            <TextField fullWidth multiline rows={3} label="Description" name="description" value={form.description} onChange={handleChange} />
            <input type="file" accept="image/*" onChange={(e) => setImage(e.target.files[0])} />

            <Box sx={{ display: 'flex', gap: 2, flexDirection: { xs: 'column', sm: 'row' } }}>
              <Button disabled={bookLoading} type="submit" fullWidth variant="contained">
                {bookLoading ? 'Adding' : 'Add Book'}
              </Button>
              <Button fullWidth variant="outlined" onClick={onClose}>Cancel</Button>
            </Box>
          </Stack>
        </form>
      </Paper>
    </Box>
  );
};

export default AddBookModal;
