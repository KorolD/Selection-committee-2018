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
    
    public partial class exams_enum
    {
        public exams_enum()
        {
            this.exams_results = new HashSet<exams_results>();
        }
    
        public short ID { get; set; }
        public string subject { get; set; }
    
        public virtual ICollection<exams_results> exams_results { get; set; }
    }
}
