 class Oracle
   def initialize
     @conn = OCI8.new(CONNECTIONS["mp-dinheiro"]["adhlg"]["user"],CONNECTIONS["mp-dinheiro"]["adhlg"]["password"],CONNECTIONS["mp-dinheiro"]["adhlg"]["connection_string"])
   end
   def find_reason_oracle
     elements = []
     sel = @conn.exec(
       "SELECT ID_TYPE_TRANSACTION_DOMAIN
       FROM AC_ADMIN.CR_TYPE_TRANSACTION_DOMAIN 
       ORDER BY ID_TYPE_TRANSACTION_DOMAIN"
       )
     while i = sel.fetch()
       elements << i.join(',')
     end
     elements
   end

 end