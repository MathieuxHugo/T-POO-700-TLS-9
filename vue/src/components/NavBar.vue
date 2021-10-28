<template>
<div>
    <b-navbar toggleable="lg" type="dark" variant="info">
        <b-navbar-brand ><router-link to="/">Home</router-link></b-navbar-brand>
        <b-navbar-brand ><router-link to="/workingtimes/1">Working Times</router-link></b-navbar-brand>
        <b-navbar-brand ><router-link to="/user">Profile</router-link></b-navbar-brand>
        <b-navbar-brand ><router-link to="/clock/1">Clock</router-link></b-navbar-brand>
    </b-navbar>
</div>
</template>

<style>
  @import '../assets/styles/Navbar.css';
</style>
