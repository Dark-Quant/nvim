return {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
        require('competitest').setup({
            testcases_use_single_file = true,
            received_problems_path = function(task, file_extension)
                local hyphen = string.find(task.group, " - ")
                local judge
                if not hyphen then
                    return string.format("%s/%s.%s", vim.fn.getcwd(), task.name, file_extension)
                end
                judge = string.sub(task.group, 1, hyphen - 1)
                if judge == "Codeforces" then
                    local url = task.url
                    url = url:gsub("/+$", "")
                    local problem = url:match("(([^/]+)/([^/]+))$")
                    problem = problem:gsub("/", "")
                    return string.format("%s/%s.%s", vim.fn.getcwd(), problem, file_extension)
                end
                return string.format("%s/%s.%s", vim.fn.getcwd(), task.name, file_extension)
            end,

            received_contests_directory = function(task, file_extension)
                local hyphen = string.find(task.group, " - ")
                local judge
                if not hyphen then
                    return vim.fn.getcwd()
                end
                judge = string.sub(task.group, 1, hyphen - 1)
                if judge == "Codeforces" then
                    local url = task.url
                    url = url:gsub("/+$", "")
                    local contest = url:match(".*/([^/]+)/[^/]+/[^/]+$")
                    return string.format("%s/%s", vim.fn.getcwd(), contest)
                end
                return vim.fn.getcwd()
            end,

            received_contests_problems_path = function(task, file_extension)
                local hyphen = string.find(task.group, " - ")
                local judge
                if not hyphen then
                    return string.format("%s.%s", task.name, file_extension)
                end
                judge = string.sub(task.group, 1, hyphen - 1)
                if judge == "Codeforces" then
                    local url = task.url
                    url = url:gsub("/+$", "")
                    local problem = url:match("([^/]+)$"):lower()
                    return string.format("%s.%s", problem, file_extension)
                end
                return string.format("%s.%s", task.name, file_extension)
            end,
        })
    end,
}
