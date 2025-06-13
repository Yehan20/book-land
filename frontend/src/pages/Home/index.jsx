import { Container } from '@mui/material'
import React, { useEffect } from 'react'



import IntroSection from './IntroSection'
import BookListSection from './BookListSection'
import { useDispatch, useSelector } from 'react-redux'
import { clearToast } from '../../features/authSlice'
import CustomizedSnackbar from '../../components/common/CustomSnackBar'


const Home = () => {
  const { toastConfig } = useSelector((state) => state.auth);
  const dispatch = useDispatch();

  useEffect(() => {
    return () => {
      dispatch(clearToast());
    };
  }, [dispatch])
  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <IntroSection />
      <BookListSection />
      {toastConfig && <CustomizedSnackbar message={toastConfig.message} variant={toastConfig.type} />}
    </Container>
  )
}

export default Home