module GlobalWar

  module Map

    class GlobalWar
      a = tile :a
      b = tile :b
      c = tile :c
      d = tile :d
      e = tile :e

      a.joins b
      a.joins c
      a.joins e

      b.joins d
      b.joins e

      c.joins e

      d.joins e
    end

  end

end
