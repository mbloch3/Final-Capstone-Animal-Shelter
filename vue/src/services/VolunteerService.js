import axios from 'axios';

export default {

    processApplication(application) {
        return axios.post("/apply", application);
    },

    getAllApplications() {
        return axios.get("/applications");
    },

    updateApplication(application) {
        console.log(typeof application.phoneNumber)
        return axios.put(`/updateapplication/${application.applicationId}`, application)
    }

}