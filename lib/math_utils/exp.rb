module MathUtils
    def self.itop(expr)
        ops = { '+' => 1, '-' => 1, '*' => 2, '/' => 2, '^' => 3 }
        expr.gsub(/(\d|\))(?=\(|\d)/, '\1*')
            .scan(/\d+(\.\d+)?|\+|\-|\*|\/|\^|\(|\)/)
            .reduce([[], []]) { |(out, stack), t|
                case t
                    when /\d/ then [out+[t], stack]
                    when '(' then [out, stack+[t]]
                    when ')' then [out+stack.reverse.take_while{|x|x!='('}, stack[0...stack.rindex('(')]]
                else
                    while stack.any? && ops[stack.last].to_i >= ops[t].to_i
                        out << stack.pop
                    end
                    [out, stack+[t]]
                end
            }.then { |out, stack| out + stack.reverse }
        end
    end

    def self.eval(pexpr)
        pexpr.reduce([]) do |stack, t|
            case t
                when /\d/ then stack << t.to_f
            else
                b, a = stack.pop(2)
                stack << a.send(t, b)
            end
        end.first
    end

    def self.calc(expr)
        self.eval(self.itop(expr))
    end

    def self.tokens(expr)
        expr.gsub(/(\d|\))(?=\(|\d)/, '\1*')
            .scan(/\d+(\.\d+)?|\+|\-|\*|\/|\^|\(|\)/)
    end

    
    
end
