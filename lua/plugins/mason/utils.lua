local M = {}

M.get_not_installed = function(items, to_package)
  local result = {}
  local Package = require "mason-core.package"
  local Registry = require "mason-registry"

  for i, item in ipairs(items) do
    local name, version = Package.Parse(item)
    local package_name = to_package[name]
    if package_name then
      local bin

      local is_found, pckg = pcall(Registry.get_package, package_name)
      if is_found then
        for b, _ in pairs(pckg.spec.bin) do
          bin = b
        end
      end
      if not is_found or vim.fn.executable(bin) ~= 1 then
        table.insert(result, item)
      end
    end
  end

  return result
end

return M
