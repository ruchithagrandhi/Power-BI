let
    Source = Excel.CurrentWorkbook(){[Name="ElectionData"]}[Content],
    ChangeType = Table.TransformColumnTypes(Source,{{"State", type text}, {"Votes", Int64.Type}}),
    Filter2024 = Table.SelectRows(ChangeType, each [Year] = 2024),
    RemoveNull = Table.SelectRows(Filter2024, each [Votes] <> null)
in
    RemoveNull