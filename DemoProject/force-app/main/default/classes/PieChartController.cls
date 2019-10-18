public class PieChartController {
    //For Pie Chart 
   public List<PieWedgeData> getPieData()  {
       List<PieWedgeData> data = new List<PieWedgeData>();
       data.add(new PieWedgeData('Africa', 14));
       data.add(new PieWedgeData('Antartica',1 ));
       data.add(new PieWedgeData('Asia', 60));
       data.add(new PieWedgeData('Australia', 2));
       data.add(new PieWedgeData('Europe', 10)); 
       data.add(new PieWedgeData('North America', 8)); 
       data.add(new PieWedgeData('South America', 5)); 
      return data; 
      //return null;
       }
           // Wrapper class for Pie Chart 
           public class PieWedgeData   {
                      public String name { get; set; } 
                       public Integer data { get; set; } 
   
                       public PieWedgeData(String name, Integer data) { 
                                   this.name = name; 
                                   this.data = data; 
                       } 
          }
          
      //for bar chart
       public class Month {
        public Integer year {get; set;}
        public Integer month {get; set;}
        public Integer count {get; set;}
        public String yearMonth {get; set; }
        Month(Integer year, Integer month, Integer count) {
            this.year = year;
            this.month = month;
            this.count = count;
            this.yearMonth = year + '/' + month;
        }
    }

    public Month[] getMonths() {
        Month[] months = new Month[] {};
        for (AggregateResult ar : [
                select
                        CALENDAR_YEAR(CreatedDate) y,
                        CALENDAR_MONTH(CreatedDate) m,
                        COUNT(Id) c
                from Contact
                group by CALENDAR_YEAR(CreatedDate), CALENDAR_MONTH(CreatedDate)
                order by CALENDAR_YEAR(CreatedDate), CALENDAR_MONTH(CreatedDate)
                ]) {
            months.add(new Month(
                    (Integer) ar.get('y'),
                    (Integer) ar.get('m'),
                    (Integer) ar.get('c')
                    ));
        }
        return months;
    }
 }