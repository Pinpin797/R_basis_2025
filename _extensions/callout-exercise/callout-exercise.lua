function Div(div)
  -- process exercise
  if div.classes:includes("callout-exercise") then
    -- default title
    local title = "Exercise"
    -- Use first element of div as title if this is a header
    if div.content[1] ~= nil and div.content[1].t == "Header" then
      title = pandoc.utils.stringify(div.content[1])
      div.content:remove(1)
    end
    -- return a callout instead of the Div
    return quarto.Callout({
      type = "exercise",
      content = div,
      title = title,
      collapse = nil
    })
  end
end
