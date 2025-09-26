module MathUtils
  module Utils
    def self.fibonacci(n)
      return 0 if n == 0
      return 1 if n == 1

      a = 0
      b = 1

      (2..n).each do
        next = a + b
        a = b
        b = next
      end

      return b
    end
  end
end
