package nz.co.codec.flexorm.command
{
    import flash.data.SQLConnection;

    public class DeleteCommand extends SQLParameterisedCommand
    {
        public function DeleteCommand(table:String, sqlConnection:SQLConnection, debugLevel:int=0)
        {
            super(table, sqlConnection, debugLevel);
        }

        override protected function prepareStatement():void
        {
            var sql:String = "delete from " + _table;
            if (_filters)
            {
                sql += " where ";
                for (var filter:String in _filters)
                {
                    sql += filter + "=" + _filters[filter] + " and ";
                }
                // remove last ' and '
                sql = sql.substring(0, sql.length - 5);
            }
            _statement.text = sql;
            _changed = false;
        }

        public function toString():String
        {
            return "DELETE " + _table + ": " + _statement.text;
        }

    }
}