<template>
  <div class="updatePet-container">
    <!-- <div class="image-container">
    <img src="../img/green-cartoon-animal-header.png" alt="Purple Cartoon Animals Header" class="image-container">
  </div> -->
    <div class="container" style="margin-bottom: 64px">
      <div class="text">Update Pet</div>
      <!-- Pet Information Block -->

      <!-- Name -->
      <form v-on:submit.prevent="submitForm">
        <div class="form-row">
          <div class="input-data">
            <input type="text" required id="petName" v-model="updatePet.name" />
            <div class="underline"></div>
            <label for="" style="opacity: 70%">Name</label>
          </div>
        </div>
        <!-- Animal Type -->
        <div class="form-row">
          <div class="input-data">
            <input type="text" required id="petType" v-model="updatePet.type" />
            <div class="underline"></div>
            <label for="" style="opacity: 70%">Animal Type</label>
          </div>
        </div>
        <!-- Age -->
        <div class="form-row">
          <div class="input-data">
            <input type="text" required id="petAge" v-model="updatePet.age" />
            <div class="underline"></div>
            <label for="" style="opacity: 70%">Age</label>
          </div>
        </div>
        
        <!-- Special Needs -->
        <div class="form-row">
          <div class="input-data">
            <input type="text" required id="petSpecialNeeds" v-model="updatePet.specialNeeds" />
            <div class="underline"></div>
            <label for="" style="opacity: 70%">Special Needs</label>
          </div>
        </div>
        <!-- Personality Traits -->
        <div class="form-row">
          <div class="input-data">
            <input type="text" required id="personalityTraits" v-model="updatePet.personalityTraits" />
            <div class="underline"></div>
            <label for="" style="opacity: 70%">Personality Traits</label>
          </div>
        </div>

      <!-- Gender -->
        <div class="form-row" style="padding-top: 32px">
          <div class="field">
            <label for="gender" class="subtitle">Gender</label>
              <ul class="checkboxes">
                <li class="checkbox" :class="{ 'selected-checkbox': updatePet.gender === 'male' }" @click="toggleGender('male')">
                  <input class="checkbox-input" id="gender-male" name="male" type="radio" value="male" v-model="updatePet.gender" />
                  <label class="checkbox-label" for="gender-male">Male</label>
                </li>
                <li class="checkbox" :class="{ 'selected-checkbox': updatePet.gender === 'female' }" @click="toggleGender('female')">
                  <input class="checkbox-input" id="gender-female" name="female" type="radio" value="female" v-model="updatePet.gender" />
                  <label class="checkbox-label" for="gender-female">Female</label>
                </li>
              </ul>
          </div>
        </div>
        <!-- Adoption Status -->
        <div class="form-row" style="padding-top: 48px">
          <div class="field">
            <label for="adopted" class="subtitle">Adopted?</label>
            <ul class="checkboxes">
              <li class="checkbox" :class="{ 'selected-checkbox': updatePet.adopted === 'true' }" @click="toggleAdopted('true')">
                <input class="checkbox-input" id="true-adopted" name="adopted" type="radio" value="true" v-model="updatePet.adopted">
                <label class="checkbox-label" for="true">
                  <span @click="toggleAdopted('true')">Yes</span>
                </label>
              </li>
              <li class="checkbox" :class="{ 'selected-checkbox': updatePet.adopted === 'false'}" @click="toggleAdopted('false')">
                <input class="checkbox-input" id="false-adopted" name="adopted" type="radio" value="false" v-model="updatePet.adopted">
                <label class="checkbox-label" for="false">
                  <span @click="toggleAdopted('false')">No</span>
                </label>
              </li>
            </ul>
          </div>
        </div>
        <!-- Good With Kids -->
        <div class="form-row" style="padding-top: 48px">
          <div class="field">
            <label for="goodWithKids" class="subtitle">Good With Kids?</label>
            <ul class="checkboxes">
              <li class="checkbox" :class="{ 'selected-checkbox': updatePet.goodWithKids === 'true' }" @click="toggleGoodWithKids('true')">
                <input class="checkbox-input" id="true-goodWithKids" name="goodWithKids" type="radio" value="true" v-model="updatePet.goodWithKids">
                <label class="checkbox-label" for="true">
                  <span @click="toggleGoodWithKids('true')">Yes</span>
                </label>
              </li>
              <li class="checkbox" :class="{ 'selected-checkbox': updatePet.goodWithKids === 'false' }" @click="toggleGoodWithKids('false')">
                <input class="checkbox-input" id="false-goodWithKids" name="goodWithKids" type="radio" value="false" v-model="updatePet.goodWithKids">
                  <label class="checkbox-label" for="false">
                <span @click="toggleGoodWithKids('false')">No</span>
                </label>
              </li>
            </ul>
          </div>
        </div>
        <!-- Good With Other Animals -->
        <div class="form-row" style="padding-top: 48px">
          <div class="field">
            <label for="goodWithOtherAnimals" class="subtitle"
              >Good With Other Animals?</label>
            <ul class="checkboxes">
              <li class="checkbox" :class="{ 'selected-checkbox': updatePet.goodWithOtherAnimals === 'true' }" @click="toggleGoodWithOtherAnimals('true')">
                <input class="checkbox-input" id="true-goodWithOtherAnimals" name="goodWithOtherAnimals" type="radio" value="true" v-model="updatePet.goodWithOtherAnimals">
                <label class="checkbox-label" for="true">
                  <span @click="toggleGoodWithOtherAnimals('true')">Yes</span>
                </label>
              </li>
              <li class="checkbox" :class="{ 'selected-checkbox': updatePet.goodWithOtherAnimals === 'false' }" @click="toggleGoodWithOtherAnimals('false')">
                <input class="checkbox-input" id="false-goodWithOtherAnimals" name="goodWithOtherAnimals" type="radio" value="false" v-model="updatePet.goodWithOtherAnimals">
                <label class="checkbox-label" for="false">
                  <span @click="toggleGoodWithOtherAnimals('false')">No</span>
                </label>
              </li>
            </ul>
          </div>
        </div>

        <!-- Picture: String-->
        <div class="form-row">
          <div class="input-data">
            <input type="text" required id="petPicture" v-model="updatePet.petPicture" />
            <div class="underline"></div>
            <label for="" style="opacity: 70%">Picture</label>
          </div>
        </div>

        <!-- Picture: Upload -->
        <!-- <div class="form-row" style="padding-top: 48px">
          <div class="input-data-petPicture">
            <label for="petPicture" class="subtitle">Picture</label>
            <input type="file" required id="petPicture" ref="fileInput" @change="handleFileChange" />
            <div class="underline"></div>
          </div>
        </div> -->

        <!-- Submit Button Block -->
        <div class="form-row">
          <div class="input-data textarea">
            <div class="form-row submit-btn">
              <div class="input-data">
                <div class="inner"></div>
                <input type="submit" value="submit">
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import PetService from "../services/PetService.js";

export default {
  data() {
    return {
      updatePet: {
        name: '',
        type: '',
        age: '',
        gender: '',
        specialNeeds: '',
        adopted: false,
        // image: null,
        petPicture: '',
        personalityTraits: '',
        goodWithKids: false,
        goodWithOtherAnimals: false,
      }
    }
  },
  props:{
    pet:Object

// call    getpet by id 
  },

  created() {
      PetService.getPetById(this.$route.params.id).
        then(response => {if(response.status == 200){
            this.updatePet=response.data;
            console.log(this.updatePet);
        }}
          
      )
  
  },

  computed: {
    isCheckboxSelected() {
      return (field) => {
        return this.updatePet[field];
      };
    },
  },
  methods: {
// Works as a String
    submitForm() {
    console.log(this.pet);
      PetService.updatePet(this.$route.params.id, this.updatePet).then(
          response => {if(response.status == 200) {
              window.alert('Pet updated')
              this.$router.push("/")
              }
           })
        },
       toggleAdopted(value) {
      this.updatePet.adopted = value;
    },
    toggleGoodWithKids(value) {
    this.updatePet.goodWithKids = value;
    },
    toggleGoodWithOtherAnimals(value) {
    this.updatePet.goodWithOtherAnimals = value;
    },
    toggleGender(value) {
        this.updatePet.gender = value;
    }
  }
}
// Testing as an Upload:
  //   submitForm() {
  //     const formData = new FormData();
  //     for (const key in this.addPet) {
  //       formData.append(key, this.addPet[key]);
  //     }
  //     PetService.addPet(formData).then((response) => {
        
  //       if (response.status == 200) {
  //         window.alert("Pet added");
  //         this.$router.push("/");
  //       }
  //     });
  //   },
  //   handleFileChange(event) {
  //     this.addPet.petPicture = event.target.files[0];
  //   },
  // 
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap");

* {
  margin: 0;
  padding: 0;
  outline: none;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}

body {
  margin: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  padding: 10px;
  font-family: "Poppins", sans-serif;
}

.updatePet-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  font-family: "Poppins", sans-serif;
  background-image: url(../img/1e4982cd-3f91-42c0-92d3-4f50f42496cb.png);
}

.image-container {
  width: 100%;
  max-height: 600px;
  overflow: hidden;
  position: relative;
}

img {
  width: 100%;
  height: 500px;
  object-fit: cover;
}

.container {
  max-width: 60%;
  width: 60%;
  background-color: #ffffff;
  padding: 64px 40px 40px 40px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
  border-radius: 8px;
  margin: 0 auto;
  margin-top: 60px; /* Adjust this value to control the vertical position of the form */
  z-index: 1;
}

.text {
  text-align: left;
  font-size: 48px;
  font-weight: 600;
  font-family: "Poppins", sans-serif;
  color: #5e8558;
  margin-left: 24px;
}

form {
  padding: 8px 0 0 0;
}

.form-row {
  display: flex;
  margin: 32px 0;
}

.other-padding {
  padding-top: 8px;
}

.field {
  margin-left: 20px;
}

.checkbox {
  display: inline-block;
  align-items: center;
  margin: 16px 10px 0 0;
  background-color: #f1f1f1;
  padding: 16px;
  border-radius: 8px;
  width: 225px;
}

.checkbox:hover {
  background-color: #CEDED0;
}

.selected-checkbox {
  background-color: #775576;
  color: #FFFFFF;
  cursor: pointer;
}

.checkbox-label:hover, .checkbox:hover {
  background-color: #775576;
  color: #FFFFFF;
}

.checkbox-label {
  flex: 1;
  margin-left: 8px;
}

.checkbox-input {
  width: auto;
  margin-bottom: 0;
}

input[type="radio"]  {
   display: none;
}

form .form-row .input-data {
  width: 100%;
  height: 40px;
  margin: 0 20px;
  position: relative;
}
form .form-row .textarea {
  height: 70px;
}
.input-data input,
.textarea textarea {
  display: block;
  width: 100%;
  height: 100%;
  border: none;
  font-size: 16px;
  border-bottom: 2px solid rgba(0, 0, 0, 0.12);
}
.input-data input:focus ~ label,
.textarea textarea:focus ~ label,
.input-data input:valid ~ label,
.textarea textarea:valid ~ label {
  transform: translateY(-20px);
  font-size: 16px;
  color: #775576;
}
.textarea textarea {
  resize: none;
  padding-top: 10px;
}
.input-data label {
  position: absolute;
  pointer-events: none;
  bottom: 10px;
  font-size: 16px;
  transition: all 0.3s ease;
}
.textarea label {
  width: 100%;
  bottom: 40px;
  background: #fff;
}
.input-data .underline {
  position: absolute;
  bottom: 0;
  height: 2px;
  width: 100%;
}
.input-data .underline:before {
  position: absolute;
  content: "";
  height: 2px;
  width: 100%;
  background: #8e37d7;
  transform: scaleX(0);
  transform-origin: center;
  transition: transform 0.3s ease;
}
.input-data input:focus ~ .underline:before,
.input-data input:valid ~ .underline:before,
.textarea textarea:focus ~ .underline:before,
.textarea textarea:valid ~ .underline:before {
  transform: scale(1);
}

.submit-btn .input-data {
  overflow: hidden;
  height: 56px !important;
  width: 25% !important;
  border-radius: 8px;
  margin: 0 !important;
}

.submit-btn .input-data .inner {
  height: 100%;
  width: 300%;
  position: absolute;
  background-color: #5e8558;
  transition: all 0.4s;
}

.submit-btn .input-data:hover .inner {
  left: 0;
  background: #7ea578;
}

.submit-btn .input-data input {
  background: none;
  border: none;
  color: #fff;
  font-size: 17px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 1px;
  cursor: pointer;
  position: relative;
  z-index: 2;
}

.input-data-petPicture {
  margin-top: -30px;
  display: flex;
  flex-direction: column;
  margin-left: 30px;
}

.input-data-petPicture label {
  margin-bottom: 10px;
}

@media (max-width: 1000px) {
  .container {
    max-width: 85%;
    width: 85%;
    padding: 16px 16px 0 16px;
    margin-top: -450px;
    z-index: 1;
  }

  .text {
    font-size: 24px;
    text-align: left;
    line-height: 40px;
    margin-left: 8px;
  }

  .checkbox {
    width: 95%;
  }

  form {
    padding: 10px 0 0 0;
  }

  .form-row {
    display: block;
  }

  form .form-row .input-data {
    margin: 0 auto;
    width: 88%;
  }

  .other-padding {
    padding-top: 24px;
  }

  .submit-btn .input-data {
    width: 100% !important;
  }
}
</style>

