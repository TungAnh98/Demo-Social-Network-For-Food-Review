select rn,[postId] ,[title] ,[imageUrl]  ,[review]  ,[locations] ,[grade] ,[price] ,[categoryId] ,[userId]
 from (    select ROW_NUMBER() over (order by postId asc) as rn, [postId]
      ,[title] ,[imageUrl],[review] ,[locations]
      ,[grade] ,[price] ,[categoryId]
      ,[userId] from Post ) as x
                        where rn between 1 and 5
