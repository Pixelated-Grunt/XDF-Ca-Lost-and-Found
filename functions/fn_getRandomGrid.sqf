#include "script_macros.hpp"
/*
 * Author: Pixelated_Grunt
 * Return a random grid location of given size
 *
 * Arguments:
 * 0: Size of the grid length in meter <NUMBER>
 * 0: Optional to return the grid from the edge of map <BOOL>
 *
 * Return Value:
 * Grid coordinates e.g [123, 456] <ARRAY>
 *
 * Example:
 * [] call LF_fnc_getRandomGrid
 *
 * Public: No
**/


params [
    ["_gridLength", 100, [100]],
    ["_edge", false, [false]]
];

private ["_mapLength", "_grids", "_fnc_randEdgeGrid", "_cells"];

_fnc_randEdgeGrid = {
    params ["_maxLength"];

    private _length = _maxLength + 1;
    // [E, S, W, N]
    private _grid = selectRandom [
        [_length, random _length],
        [random _length, 0],
        [0, random _length],
        [random _length, _length]
    ];
    _grid
};

_mapLength = worldSize;
_cells = _mapLength / _gridLength;

if (_edge) then {
    _grids = [_cells] call _fnc_randEdgeGrid
} else {
    _grids = [random _cells + 1, random _cells + 1]
};

_grids
