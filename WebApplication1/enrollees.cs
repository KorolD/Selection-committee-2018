//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Enrollment_campaign_ns
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class enrollees
    {
        public enrollees()
        {
            this.exams_results = new HashSet<exams_results>();
        }
    
        public int ID { get; set; }
        [Required(ErrorMessage="Enter your name")]
        public string name { get; set; }
        [Required(ErrorMessage = "Enter your surname")]
        public string surname { get; set; }
        [Required(ErrorMessage = "Enter your patronymic")]
        public string patronymic { get; set; }
        [Required(ErrorMessage = "Enter your email(login)")]
        public string email { get; set; }
        public string passport { get; set; }
        public string country { get; set; }
        [Required(ErrorMessage = "Enter your city")]
        public string locality { get; set; }
        [Required(ErrorMessage = "Enter your adress")]
        public string address { get; set; }
        [Required(ErrorMessage = "Enter your password")]
        public string password { get; set; }
        [Required(ErrorMessage = "Enter your birthdate")]
        public System.DateTime birthdate { get; set; }
    
        public virtual ICollection<exams_results> exams_results { get; set; }

        public virtual void Update(enrollees new_state)
        {
            address = new_state.address;
            birthdate = new_state.birthdate;
            country = new_state.country;
            email = new_state.email;
            locality = new_state.locality;
            name = new_state.name;
            passport = new_state.passport;
            password = new_state.password;
            patronymic = new_state.patronymic;
            surname = new_state.surname;
        }
    }
}
