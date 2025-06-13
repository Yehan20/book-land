
import axios from 'axios';

// Customization of axios instance to add our base our and allow  send cookei containing jwt
const axiosClient = axios.create({
  baseURL:'http://localhost:8000/api/',
  // import.meta.env.VITE_API_BASE_URL, 
  withCredentials: true, 
});

export default axiosClient;
