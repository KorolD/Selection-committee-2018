//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EnrollmentCampaign
{
    using System;
    using System.Collections.Generic;
    
    public partial class parent
    {
        public int enrollee_ID { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public string patronymic { get; set; }
        public System.DateTime birthdate { get; set; }
    
        public virtual enrollee enrollee { get; set; }
    }
}
