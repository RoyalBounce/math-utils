module MathUtils
    def self.fibonacci(n)
      return 0 if n == 0
      return 1 if n == 1

      a = 0
      b = 1

      (2..n).each do
        fib = a + b
        a = b
        b = fib
      end

      return b
    end
end
