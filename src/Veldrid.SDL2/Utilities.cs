﻿using System;
using System.Text;

namespace Veldrid.Sdl2
{
    internal static class Utilities
    {
        public static unsafe string GetString(byte* stringStart)
        {
            try
            {
                if (stringStart == null)
                {
                    return null;
                }

                int characters = 0;
                while (stringStart[characters] != 0)
                {
                    characters++;
                }

                return Encoding.UTF8.GetString(stringStart, characters);
            }
            catch (Exception e)
            {
                return null;
            }

        }
    }
}
