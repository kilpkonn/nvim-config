local present, true_zen = pcall(require, "true-zen")
if not present then
  return
end

true_zen.setup {}
